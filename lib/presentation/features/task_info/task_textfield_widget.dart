import 'package:flutter/material.dart';
import 'package:to_do_list_new/internal/dependencies/locator.dart';
import 'package:to_do_list_new/s.dart';

class TaskTextField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final id;
  const TaskTextField({Key? key, required this.id}) : super(key: key);

  @override
  State<TaskTextField> createState() => _TaskTextFieldState();
}

class _TaskTextFieldState extends State<TaskTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tasksState = Locator.tasksState;
    if (widget.id != null) {
      if (tasksState.tasks
              .singleWhere(
                (e) => e.id == widget.id,
              )
              .text !=
          null) {
        _textEditingController.text = tasksState.tasks
            .singleWhere(
              (e) => e.id == widget.id,
            )
            .text
            .toString();
      } else {
        _textEditingController.text = '';
      }
    } else {
      null;
    }
    return Material(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        elevation: 3,
        child: TextField(
            onChanged: (text) {
              tasksState.changeTextOfTask(text);
            },
            minLines: 3,
            maxLines: null,
            controller: _textEditingController,
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).unselectedWidgetColor,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: S.of(context).get("doSomething"),
                hintStyle: Theme.of(context).textTheme.labelMedium)));
  }
}
