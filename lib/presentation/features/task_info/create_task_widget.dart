import 'package:flutter/material.dart';
import 'package:to_do_list_new/internal/dependencies/locator.dart';
import 'package:to_do_list_new/s.dart';
import 'package:to_do_list_new/presentation/features/task_info/deadline_widget.dart';
import 'package:to_do_list_new/presentation/features/task_info/priority_widget.dart';
import 'package:to_do_list_new/presentation/features/task_info/task_textfield_widget.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class CreateTaskWidget extends StatefulWidget {
  final id;
  const CreateTaskWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  @override
  Widget build(BuildContext context) {
    bool newTask = widget.id == null ? true : false;
    final tasksState = Locator.tasksState;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () => throw Exception(),
              child: const Text("Throw Test Exception"),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskTextField(id: widget.id),
                  PriorityWidget(id: widget.id),
                  const Divider(
                    height: 2,
                  ),
                  DeadlineWidget(id: widget.id)
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
                    S.of(context).get("delete"),
                    style: CustomTextTheme.body.copyWith(
                        color: newTask ? LightColors.gray : LightColors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context, () {
                      setState(() {});
                    });
                    tasksState.deleteTask(widget.id);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
