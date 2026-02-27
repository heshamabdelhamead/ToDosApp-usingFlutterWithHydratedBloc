
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_using_bloc/tasks_screen/bloc/tasks_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'ToDos  Demo app using bloc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textFieldTaskController;
  
  @override
  void initState() {
    super.initState();
    textFieldTaskController = TextEditingController();
  }

  @override
  void dispose() {
    textFieldTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => TasksBloc(),
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.all(20),
            //  padding: EdgeInsets.all(8) ,
              child: Column(
                spacing: 20,
                children: [
                  TextField(
                    controller: textFieldTaskController,
                    decoration: InputDecoration(hint: Text("Enter a New Task")),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (textFieldTaskController.text.isEmpty) return;
                      context.read<TasksBloc>().add(AddNewTask(title: textFieldTaskController.text));
                      
                    },
                    child: Text("Add Task"),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.tasks.length,
              
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(state.tasks[index].title),
                          leading: Checkbox(
                            value: state.tasks[index].isCompleted,
                            onChanged: (value) {
                              context.read<TasksBloc>().add(UpdateTaskStatus(index));
                            },
                          ),
                          trailing: IconButton(
                            onPressed: () {
                             context.read<TasksBloc>().add(RemoveTask(index: index));
                            },
                            icon: Icon(Icons.delete),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
