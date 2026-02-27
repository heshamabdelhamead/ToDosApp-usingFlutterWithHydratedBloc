part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

class AddNewTask extends TasksEvent{
  final String title ;
  AddNewTask({required this.title});
}

class RemoveTask extends TasksEvent {
  final int index;

  RemoveTask({required this.index});
}
class UpdateTaskStatus extends TasksEvent{
  final int index;

  UpdateTaskStatus(this.index);
}

