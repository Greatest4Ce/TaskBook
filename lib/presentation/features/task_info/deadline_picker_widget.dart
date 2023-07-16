import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class DeadlinePicker extends StatefulWidget {
  final id;
  const DeadlinePicker({Key? key, this.id}) : super(key: key);

  @override
  State<DeadlinePicker> createState() => _DeadlinePickerState();
}

class _DeadlinePickerState extends State<DeadlinePicker> {
  @override
  Widget build(BuildContext context) {
    bool newTask = widget.id == null ? true : false;
    bool switchValue = newTask
        ? Provider.of<TasksState>(context).task.deadline != ''
            ? true
            : false
        : Provider.of<TasksState>(context)
                    .tasks
                    .singleWhere((e) => e.id == widget.id,
                        orElse: () => Provider.of<TasksState>(context).task)
                    .deadline !=
                ''
            ? true
            : false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          newTask
              ? context.watch<TasksState>().task.deadline
              : context
                  .watch<TasksState>()
                  .tasks
                  .singleWhere((e) => e.id == widget.id,
                      orElse: () => Provider.of<TasksState>(context).task)
                  .deadline
                  .toString(),
          style: CustomTextTheme.subhead.copyWith(color: LightColors.blue),
        ),
        Switch(
            inactiveTrackColor: LightColors.grayLight,
            value: switchValue,
            onChanged: (bool value) async {
              if (value == true) {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  helpText: '2021',
                  cancelText: 'Отмена',
                  confirmText: 'Готово',
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                );
                if (newDate != null) {
                  String newDateFormatted =
                      DateFormat('dd.MM.yyyy').format(newDate);
                  Provider.of<TasksState>(context, listen: false)
                      .changeDeadline(newDateFormatted);
                }
                setState(() {
                  switchValue = true;
                });
              } else {
                Provider.of<TasksState>(context, listen: false)
                    .changeDeadline('');
                setState(() {
                  switchValue = false;
                });
              }
            })
      ],
    );
  }
}
