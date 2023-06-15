import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/routes/navigation_manager.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/presentation/features/task/newtask_widget.dart';
import 'package:to_do_list_new/presentation/features/task/task_widget.dart';
import 'package:to_do_list_new/presentation/features/task/visbility_button.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              NavigationManager.instance.openTaskScreen();
            }),
        body: CustomScrollView(
          slivers: [
            const SliverPersistentHeader(
                pinned: true, delegate: MyHeaderDelegate()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: context.watch<TasksState>().tasks.length + 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return index ==
                                  context.watch<TasksState>().tasks.length
                              ? const NewTaskWIdget()
                              : TaskWidget(
                                  id: Provider.of<TasksState>(context,
                                          listen: false)
                                      .tasks[index]
                                      .id);
                        }),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  const MyHeaderDelegate();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(progress),
            spreadRadius: 4,
            blurRadius: 4,
          ),
        ],
      ),
      padding: EdgeInsets.only(
          left: 9 / progress < 60 ? 9 / progress : 60, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Мои дела',
                  style: TextStyle.lerp(
                    CustomTextTheme.largeTitle,
                    CustomTextTheme.title.copyWith(),
                    progress,
                  ),
                ),
                Text(
                  'Выполнено - ${context.watch<TasksState>().doneCounter}',
                  style: TextStyle.lerp(
                      CustomTextTheme.subhead.copyWith(fontSize: 16),
                      CustomTextTheme.subhead.copyWith(fontSize: 0),
                      progress * 10),
                ),
              ],
            ),
          ),
          const VisibilityButton()
        ],
      ),
    );
  }

  @override
  double get maxExtent => 170;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
