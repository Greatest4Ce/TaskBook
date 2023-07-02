import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_new/presentation/features/task/check_box.dart';
import 'package:to_do_list_new/presentation/screens/create_task_screen.dart';
import 'package:to_do_list_new/presentation/styles/icons.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';
import '../../../domain/state/tasks_state_mobx.dart';
import '../../../main.dart';

class TaskTileWidget extends StatelessWidget {
  final String id;
  const TaskTileWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksState = getIt<TasksState>();
    return ListTile(
      isThreeLine: true,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateTaskScreen(id: id)));
        tasksState.changeTask(id);
      },
      leading: Observer(
        builder: (_) => CustomCheckBox(
          importance:
              tasksState.tasks.singleWhere((e) => e.id == id).importance,
          status: tasksState.tasks.singleWhere((e) => e.id == id).done,
        ),
      ),
      title: Observer(
        builder: (_) => tasksState.tasks
                    .singleWhere((e) => e.id == id)
                    .importance ==
                'low'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1, right: 3),
                    child: Transform.rotate(
                        angle: 4.71,
                        child: const SizedBox(
                            height: 20,
                            width: 13,
                            child: CustomIcons.arrowback)),
                  ),
                  Flexible(
                    child: Observer(
                      builder: (_) => Text(
                        tasksState.tasks.singleWhere((e) => e.id == id).text,
                        style: tasksState.tasks
                                .singleWhere((e) => e.id == id)
                                .done
                            ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: LightColors.gray)
                            : Theme.of(context).textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              )
            : tasksState.tasks.singleWhere((e) => e.id == id).importance ==
                    'important'
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 2, right: 4),
                        child: Text(
                          '!!',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Flexible(
                        child: Observer(
                          builder: (_) => Text(
                            tasksState.tasks
                                .singleWhere((e) => e.id == id)
                                .text,
                            style: tasksState.tasks
                                    .singleWhere((e) => e.id == id)
                                    .done
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        color: LightColors.gray)
                                : Theme.of(context).textTheme.bodyMedium,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  )
                : Observer(
                    builder: (context) => Text(
                      tasksState.tasks.singleWhere((e) => e.id == id).text,
                      style: tasksState.tasks
                              .singleWhere((e) => e.id == id)
                              .done
                          ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: LightColors.gray)
                          : Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Observer(
          builder: (_) => Text(
            tasksState.tasks.singleWhere((e) => e.id == id).deadline == null
                ? ''
                : DateFormat.yMMMMd(Platform.localeName)
                    .format(tasksState.tasks
                        .singleWhere((e) => e.id == id)
                        .deadline)
                    .toString(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
      trailing: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [CustomIcons.infooutline],
      ),
    );
  }
}
