import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list_new/S.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

import '../../../domain/state/tasks_state_mobx.dart';
import '../../../main.dart';

class PriorityWidget extends StatefulWidget {
  final id;
  const PriorityWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<PriorityWidget> createState() => _PriorityWidgetState();
}

class _PriorityWidgetState extends State<PriorityWidget> {
  @override
  Widget build(BuildContext context) {
    final tasksState = getIt<TasksState>();
    bool newTask = widget.id == null;
    return newTask
        ? Observer(
            builder: (_) => Container(
              height: 92,
              padding: const EdgeInsets.only(top: 28),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).get("importance"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16),
                    child: PopupMenuButton(
                        position: PopupMenuPosition.under,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        initialValue: tasksState.task.importance,
                        child: Observer(
                          builder: (_) => Text(
                            tasksState.task.importance == "important"
                                ? S.of(context).get("high")
                                : tasksState.task.importance == "low"
                                    ? S.of(context).get("low")
                                    : S.of(context).get("basic"),
                            style: tasksState.task.importance == 'basic'
                                ? Theme.of(context).textTheme.labelMedium
                                : tasksState.task.importance == 'important'
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: LightColors.red)
                                    : Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(color: LightColors.blue),
                          ),
                        ),
                        onSelected: (value) {
                          tasksState.changePriority(value);
                          setState(() {});
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'basic',
                                child: Text(S.of(context).get("basic")),
                              ),
                              PopupMenuItem<String>(
                                value: 'low',
                                child: Text(S.of(context).get("low")),
                              ),
                              PopupMenuItem<String>(
                                value: 'important',
                                child: Text(
                                  S.of(context).get("high"),
                                  style: CustomTextTheme.body
                                      .copyWith(color: LightColors.red),
                                ),
                              ),
                            ]),
                  ),
                ],
              ),
            ),
          )
        : Observer(
            builder: (_) => Container(
              height: 92,
              padding: const EdgeInsets.only(top: 28),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).get("importance"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16),
                    child: PopupMenuButton(
                        position: PopupMenuPosition.under,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        initialValue: newTask
                            ? S.of(context).get("basic")
                            : tasksState.tasks
                                .singleWhere((e) => e.id == widget.id,
                                    orElse: () => tasksState.task)
                                .importance,
                        child: Text(
                          tasksState.tasks
                                      .singleWhere((e) => e.id == widget.id,
                                          orElse: () => tasksState.task)
                                      .importance ==
                                  "important"
                              ? S.of(context).get("high")
                              : tasksState.tasks
                                          .singleWhere((e) => e.id == widget.id,
                                              orElse: () => tasksState.task)
                                          .importance ==
                                      "low"
                                  ? S.of(context).get("low")
                                  : S.of(context).get("basic"),
                          style: tasksState.tasks
                                      .singleWhere((e) => e.id == widget.id,
                                          orElse: () => tasksState.task)
                                      .importance ==
                                  'basic'
                              ? Theme.of(context).textTheme.labelMedium
                              : tasksState.tasks
                                          .singleWhere((e) => e.id == widget.id,
                                              orElse: () => tasksState.task)
                                          .importance ==
                                      'important'
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: LightColors.red)
                                  : Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: LightColors.blue),
                        ),
                        onSelected: (value) {
                          tasksState.changePriority(value);
                          setState(() {});
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'basic',
                                child: Text(S.of(context).get("basic")),
                              ),
                              PopupMenuItem<String>(
                                value: 'low',
                                child: Text(S.of(context).get("low")),
                              ),
                              PopupMenuItem<String>(
                                value: 'important',
                                child: Text(
                                  S.of(context).get("high"),
                                  style: CustomTextTheme.body
                                      .copyWith(color: LightColors.red),
                                ),
                              ),
                            ]),
                  ),
                ],
              ),
            ),
          );
  }
}
