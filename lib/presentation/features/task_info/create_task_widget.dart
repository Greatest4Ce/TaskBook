import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/routes/navigation_manager.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/presentation/features/task_info/deadline_widget.dart';
import 'package:to_do_list_new/presentation/features/task_info/priority_widget.dart';
import 'package:to_do_list_new/presentation/features/task_info/tast_textfield_widget.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class CreateTaskWidget extends StatelessWidget {
  final id;
  const CreateTaskWidget({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool newTask = id == null ? true : false;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskTextField(id: id),
                  PriorityWidget(id: id),
                  const Divider(
                    height: 2,
                  ),
                  DeadlineWidget(id: id)
                ],
              ),
            ),
            const Divider(height: 2),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextButton.icon(
                  style: TextButton.styleFrom(
                    primary:
                        newTask ? LightColors.backPrimary : LightColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                    ),
                    padding: const EdgeInsets.only(
                      left: 13,
                      right: 13,
                    ),
                  ),
                  icon: Icon(
                    Icons.delete,
                    color: newTask ? LightColors.gray : LightColors.red,
                  ),
                  label: Text(
                    'Удалить',
                    style: CustomTextTheme.body.copyWith(
                        color: newTask ? LightColors.gray : LightColors.red),
                  ),
                  onPressed: () {
                    NavigationManager.instance.backHome();
                    Provider.of<TasksState>(context, listen: false)
                        .deleteTask(id);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
