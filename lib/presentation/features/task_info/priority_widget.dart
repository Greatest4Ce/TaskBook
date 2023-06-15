import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class PriorityWidget extends StatelessWidget {
  final id;
  const PriorityWidget({Key? key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool newTask = id == null ? true : false;
    return newTask
        ? Container(
            height: 92,
            padding: const EdgeInsets.only(top: 28),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Приоритет'),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 16),
                  child: PopupMenuButton(
                      position: PopupMenuPosition.under,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      initialValue: context.watch<TasksState>().task.priority,
                      child: Text(
                        context.watch<TasksState>().task.priority == "Высокий"
                            ? "!! ${context.watch<TasksState>().task.priority}"
                            : context.watch<TasksState>().task.priority,
                        style:
                            context.watch<TasksState>().task.priority == 'Нет'
                                ? CustomTextTheme.subhead
                                : context.watch<TasksState>().task.priority ==
                                        'Высокий'
                                    ? CustomTextTheme.body
                                        .copyWith(color: LightColors.red)
                                    : CustomTextTheme.subhead
                                        .copyWith(color: LightColors.blue),
                      ),
                      onSelected: (value) {
                        Provider.of<TasksState>(context, listen: false)
                            .changePriority(value);
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'Нет',
                              child: Text('Нет'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'Низкий',
                              child: Text('Низкий'),
                            ),
                            PopupMenuItem<String>(
                              value: 'Высокий',
                              child: Text(
                                '!! Высокий',
                                style: CustomTextTheme.body
                                    .copyWith(color: LightColors.red),
                              ),
                            ),
                          ]),
                ),
              ],
            ),
          )
        : Container(
            height: 92,
            padding: const EdgeInsets.only(top: 28),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Приоритет'),
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
                          ? 'Нет'
                          : context
                              .watch<TasksState>()
                              .tasks
                              .singleWhere((e) => e.id == id,
                                  orElse: () =>
                                      Provider.of<TasksState>(context).task)
                              .priority,
                      child: Text(
                        context
                                    .watch<TasksState>()
                                    .tasks
                                    .singleWhere((e) => e.id == id,
                                        orElse: () =>
                                            Provider.of<TasksState>(context)
                                                .task)
                                    .priority ==
                                "Высокий"
                            ? "!! ${context.watch<TasksState>().task.priority}"
                            : context.watch<TasksState>().task.priority,
                        style: context
                                    .watch<TasksState>()
                                    .tasks
                                    .singleWhere((e) => e.id == id,
                                        orElse: () =>
                                            Provider.of<TasksState>(context)
                                                .task)
                                    .priority ==
                                'Нет'
                            ? CustomTextTheme.subhead
                            : context
                                        .watch<TasksState>()
                                        .tasks
                                        .singleWhere((e) => e.id == id,
                                            orElse: () =>
                                                Provider.of<TasksState>(context)
                                                    .task)
                                        .priority ==
                                    'Высокий'
                                ? CustomTextTheme.body
                                    .copyWith(color: LightColors.red)
                                : CustomTextTheme.subhead
                                    .copyWith(color: LightColors.blue),
                      ),
                      onSelected: (value) {
                        Provider.of<TasksState>(context, listen: false)
                            .changePriority(value);
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'Нет',
                              child: Text('Нет'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'Низкий',
                              child: Text('Низкий'),
                            ),
                            PopupMenuItem<String>(
                              value: 'Высокий',
                              child: Text(
                                '!! Высокий',
                                style: CustomTextTheme.body
                                    .copyWith(color: LightColors.red),
                              ),
                            ),
                          ]),
                ),
              ],
            ),
          );
  }
}
