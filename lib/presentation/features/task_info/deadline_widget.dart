import 'package:flutter/material.dart';
import 'package:to_do_list_new/s.dart';
import 'package:to_do_list_new/presentation/features/task_info/deadline_picker_widget.dart';

class DeadlineWidget extends StatelessWidget {
  final id;
  const DeadlineWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).get("doItUntil")),
          DeadlinePicker(id: id)
        ],
      ),
    );
  }
}
