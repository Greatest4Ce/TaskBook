import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/presentation/features/task/check_box.dart';
import 'package:to_do_list_new/presentation/screens/create_task_screen.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/icons.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class TaskTileWidget extends StatelessWidget {
  final String id;
  const TaskTileWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateTaskScreen(id: id)));
        Provider.of<TasksState>(context, listen: false).taskChange(id);
      },
      leading: CustomCheckBox(
        priority: context
            .watch<TasksState>()
            .tasks
            .singleWhere((e) => e.id == id)
            .priority,
        status: context
            .watch<TasksState>()
            .tasks
            .singleWhere((e) => e.id == id)
            .status,
      ),
      title: context
                  .watch<TasksState>()
                  .tasks
                  .singleWhere((e) => e.id == id)
                  .priority ==
              'Низкий'
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1, right: 3),
                  child: Transform.rotate(
                      angle: 4.71,
                      child: const SizedBox(
                          height: 20, width: 13, child: CustomIcons.arrowback)),
                ),
                Flexible(
                  child: Text(
                    context
                        .watch<TasksState>()
                        .tasks
                        .singleWhere((e) => e.id == id)
                        .taskText,
                    style: context
                                .watch<TasksState>()
                                .tasks
                                .singleWhere((e) => e.id == id)
                                .status ==
                            'done'
                        ? CustomTextTheme.body.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: LightColors.gray)
                        : CustomTextTheme.body,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          : context
                      .watch<TasksState>()
                      .tasks
                      .singleWhere((e) => e.id == id)
                      .priority ==
                  'Высокий'
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
                      child: Text(
                        Provider.of<TasksState>(context, listen: true)
                            .tasks
                            .singleWhere((e) => e.id == id)
                            .taskText,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              : Text(
                  Provider.of<TasksState>(context, listen: true)
                      .tasks
                      .singleWhere((e) => e.id == id)
                      .taskText,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(Provider.of<TasksState>(context, listen: true)
                    .tasks
                    .singleWhere((e) => e.id == id)
                    .deadline !=
                ''
            ? Provider.of<TasksState>(context, listen: true)
                .tasks
                .singleWhere((e) => e.id == id)
                .deadline
            : ''),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [CustomIcons.infooutline],
      ),
    );
  }
}
