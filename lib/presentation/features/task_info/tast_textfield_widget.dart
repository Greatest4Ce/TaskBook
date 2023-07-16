import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';

class TaskTextField extends StatefulWidget {
  final id;
  const TaskTextField({Key? key, this.id}) : super(key: key);

  @override
  State<TaskTextField> createState() => _TaskTextFieldState();
}

class _TaskTextFieldState extends State<TaskTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      if (context
              .watch<TasksState>()
              .tasks
              .singleWhere((e) => e.id == widget.id,
                  orElse: () => Provider.of<TasksState>(context).task)
              // ignore: unnecessary_null_comparison
              .taskText !=
          null) {
        _textEditingController.text = context
            .watch<TasksState>()
            .tasks
            .singleWhere((e) => e.id == widget.id,
                orElse: () => Provider.of<TasksState>(context).task)
            .taskText
            .toString();
      } else {
        _textEditingController.text = '';
      }
    } else {
      null;
    }
    return Material(
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
        elevation: 3,
        child: TextField(
            onEditingComplete: () {
              Provider.of<TasksState>(context, listen: false)
                  .changeText(_textEditingController.text);
              FocusScope.of(context).unfocus();
            },
            maxLines: null,
            controller: _textEditingController,
            style: const TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hintText: 'Что надо сделать...',
            )));
  }
}
