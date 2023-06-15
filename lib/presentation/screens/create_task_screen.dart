import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/routes/navigation_manager.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/presentation/features/task_info/create_task_widget.dart';
import 'package:to_do_list_new/presentation/features/task_info/app_bar.dart';

class CreateTaskScreen extends StatelessWidget {
  final id;
  const CreateTaskScreen({Key? key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool newTask = context.watch<TasksState>().task.id == '';
    return Scaffold(
      appBar: TaskInfoAppBar(backOnPressed: () {
        NavigationManager.instance.pop();
        Provider.of<TasksState>(context, listen: false).disposeTask();
      }, saveOnPressed: () {
        if (newTask == true) {
          if (Provider.of<TasksState>(context, listen: false).task.taskText !=
              '') {
            NavigationManager.instance.backHome();
            Provider.of<TasksState>(context, listen: false).saveNewTask();
            Provider.of<TasksState>(context, listen: false).disposeTask();
          } else {
            null;
          }
        } else {
          NavigationManager.instance.backHome();
          Provider.of<TasksState>(context, listen: false).savetask(id);
          Provider.of<TasksState>(context, listen: false).disposeTask();
        }
      }),
      body: CreateTaskWidget(id: id),
    );
  }
}
