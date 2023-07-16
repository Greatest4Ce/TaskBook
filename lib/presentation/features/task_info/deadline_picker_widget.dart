import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_new/internal/dependencies/locator.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';
import 'package:to_do_list_new/s.dart';

class DeadlinePicker extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final id;
  const DeadlinePicker({Key? key, required this.id}) : super(key: key);

  @override
  State<DeadlinePicker> createState() => _DeadlinePickerState();
}

class _DeadlinePickerState extends State<DeadlinePicker> {
  @override
  Widget build(BuildContext context) {
    final tasksState = Locator.tasksState;
    bool newTask = widget.id == null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Observer(
          builder: (_) => Text(
            newTask
                ? tasksState.task.deadline == null
                    ? ''
                    : DateFormat.yMMMMd(Platform.localeName)
                        .format(tasksState.task.deadline!)
                : tasksState.tasks
                            .singleWhere(
                              (e) => e.id == widget.id,
                            )
                            .deadline ==
                        null
                    ? ''
                    : DateFormat.yMMMMd(Platform.localeName)
                        .format(tasksState.tasks
                            .singleWhere(
                              (e) => e.id == widget.id,
                            )
                            .deadline),
            style: CustomTextTheme.subhead.copyWith(color: LightColors.blue),
          ),
        ),
        Switch(
            inactiveTrackColor: LightColors.grayLight,
            value: tasksState.task.deadline != null,
            onChanged: (bool value) async {
              if (value) {
                await datePicker(tasksState, context);
                setState(() {});
              } else {
                setState(() {});
                tasksState.changeDeadline(null);
              }
            })
      ],
    );
  }

  Future<void> datePicker(tasksState, context) async {
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
