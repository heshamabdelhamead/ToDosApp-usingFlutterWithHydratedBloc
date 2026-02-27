import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_using_bloc/tasks_screen/task_model.dart';
import 'package:uuid/uuid.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial()) {

    on<AddNewTask>((event, emit) {
     final newTask = TaskModel(
      id: Uuid().v4.hashCode,
      title: event.title,
      isCompleted: false,
    );
    emit(UpdateTasks([...state.tasks, newTask]));
    });

    on<RemoveTask>((event,emit){
      final updatedTasks = List.of(state.tasks)..removeAt(event.index);
    emit(UpdateTasks(updatedTasks));
    });

    on<UpdateTaskStatus> ((event,emit){
      final newTasks = List<TaskModel>.from(state.tasks);
    newTasks[event.index] = newTasks[event.index].copyWith(
      isCompleted: !newTasks[event.index].isCompleted,
    );
    emit(UpdateTasks(newTasks));
    });
  }
  
  @override
  
Map<String, dynamic>? toJson(TasksState state) {
  return {
    'tasks': state.tasks
        .map((task) => task.toJson())
        .toList(),
  };
}
  
  @override
 TasksState? fromJson(Map<String, dynamic> json) {
  try {
    final tasks = (json['tasks'] as List)
        .map((task) => TaskModel.fromJson(task))
        .toList();

    return UpdateTasks(tasks);
  } catch (_) {
    
  }
}

}
