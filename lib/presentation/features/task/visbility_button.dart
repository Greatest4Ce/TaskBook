import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/presentation/styles/icons.dart';

class VisibilityButton extends StatelessWidget {
  const VisibilityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 50,
      child: IconButton(
          onPressed: () {
            Provider.of<TasksState>(context, listen: false).allVisible();
          },
          icon: context.watch<TasksState>().visibleAll
              ? CustomIcons.visibilityoff
              : CustomIcons.visibility),
    );
  }
}
