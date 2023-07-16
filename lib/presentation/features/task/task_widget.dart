import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list_new/internal/dependencies/locator.dart';
import 'package:to_do_list_new/presentation/features/task/task_tile_widget.dart';
import 'package:to_do_list_new/presentation/styles/icons.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class TaskWidget extends StatefulWidget {
  final String id;
  const TaskWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  double leftValue = 0;
  double rightValue = 0;

  @override
  Widget build(BuildContext context) {
    final tasksState = Locator.tasksState;
    return Observer(
      builder: (_) => Visibility(
        visible: tasksState.visibleAll
            ? tasksState.visibleAll
            : !tasksState.tasks.singleWhere((e) => e.id == widget.id).done,
        child: Dismissible(
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              if (tasksState.tasks.singleWhere((e) => e.id == widget.id).done) {
                tasksState.markAsNotDone(widget.id);
              } else {
                tasksState.markAsDone(widget.id);
              }
              return false;
            } else {
              tasksState.deleteTask(widget.id);
              return true;
            }
          },
          onUpdate: (DismissUpdateDetails details) {
            if (details.direction == DismissDirection.startToEnd) {
              setState(() {
                leftValue =
                    details.progress * MediaQuery.of(context).size.width / 1.2;
              });
            } else {
              setState(() {
                rightValue =
                    details.progress * MediaQuery.of(context).size.width / 1.2;
              });
            }
          },
          background: Container(
              padding:
                  EdgeInsets.only(left: leftValue > 20 ? leftValue - 20 : 0),
              color: LightColors.green,
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  height: leftValue / 5,
                  width: leftValue / 5,
                  child: CustomIcons.check)),
          secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: LightColors.red,
              padding:
                  EdgeInsets.only(right: rightValue > 20 ? rightValue - 20 : 0),
              child: SizedBox(
                  height: rightValue / 5,
                  width: rightValue / 5,
                  child: CustomIcons.delete)),
          key: ValueKey<String>(widget.id),
          child: TaskTileWidget(
            id: widget.id,
          ),
        ),
      ),
    );
  }
}
