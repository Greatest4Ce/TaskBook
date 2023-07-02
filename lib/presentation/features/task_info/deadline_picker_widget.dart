import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_new/s.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

import '../../../domain/state/tasks_state_mobx.dart';
import '../../../main.dart';

class DeadlinePicker extends StatefulWidget {
  final id;
  const DeadlinePicker({Key? key, required this.id}) : super(key: key);

  @override
  State<DeadlinePicker> createState() => _DeadlinePickerState();
}

class _DeadlinePickerState extends State<DeadlinePicker> {
  @override
  Widget build(BuildContext context) {
    final tasksState = getIt<TasksState>();
    bool newTask = widget.id == null ? true : false;
    bool switchValue = newTask
        ? tasksState.task.deadline != null
            ? true
            : false
        : tasksState.tasks
                    .singleWhere(
                      (e) => e.id == widget.id,
                    )
                    .deadline !=
                null
            ? true
            : false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Observer(
          builder: (_) => Text(
            newTask
                ? tasksState.task.deadline == null
                    ? ''
                    : DateFormat("dd.MM.yyyy").format(tasksState.task.deadline!)
                : tasksState.tasks
                            .singleWhere(
                              (e) => e.id == widget.id,
                            )
                            .deadline ==
                        null
                    ? ''
                    : DateFormat("dd.MM.yyyy").format(tasksState.tasks
                        .singleWhere(
                          (e) => e.id == widget.id,
                        )
                        .deadline),
            style: CustomTextTheme.subhead.copyWith(color: LightColors.blue),
          ),
        ),
        Switch(
            inactiveTrackColor: LightColors.grayLight,
            value: switchValue,
            onChanged: (bool value) async {
              if (value == true) {
                datePicker(tasksState);
                setState(() {
                  switchValue = true;
                });
              } else {
                setState(() {
                  switchValue = false;
                });
                tasksState.changeDeadline(null);
              }
            })
      ],
    );
  }

  void datePicker(tasksState) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      helpText: '2021',
      cancelText: S.of(context).get("cancel"),
      confirmText: S.of(context).get("done"),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (newDate != null) {
      tasksState.changeDeadline(newDate);
    }
  }
}
