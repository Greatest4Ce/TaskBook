import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/S.dart';
import 'package:to_do_list_new/domain/routes/navigation_manager.dart';
import 'package:to_do_list_new/domain/state/tasks_state_mobx.dart';
import 'package:to_do_list_new/main.dart';
import 'package:to_do_list_new/presentation/features/task/newtask_widget.dart';
import 'package:to_do_list_new/presentation/features/task/task_widget.dart';
import 'package:to_do_list_new/presentation/features/task/visbility_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final TasksState tasksState = getIt<TasksState>();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              NavigationManager.instance.openTaskScreen();
            }),
        body: CustomScrollView(
          slivers: [
            Observer(
                builder: (_) => SliverPersistentHeader(
                    pinned: true,
                    delegate:
                        MyHeaderDelegate(counter: tasksState.doneCounter))),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (_) => tasksState.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Card(
                            margin: const EdgeInsets.all(0),
                            child: Observer(
                              builder: (context) => tasksState.isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : tasksState.tasks == []
                                      ? const NewTaskWIdget()
                                      : Observer(
                                          builder: (_) => ListView.builder(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              itemCount:
                                                  tasksState.tasks.length + 1,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return index ==
                                                        tasksState.tasks.length
                                                    ? const NewTaskWIdget()
                                                    : TaskWidget(
                                                        id: tasksState
                                                            .tasks[index].id);
                                              }),
                                        ),
                            ),
                          ),
                        ),
                ),
              ),
            )
          ],
        ));
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  int counter;
  MyHeaderDelegate({required this.counter});
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
                  S.of(context).get("myTasks"),
                  style: TextStyle.lerp(
                    Theme.of(context).textTheme.titleLarge,
                    Theme.of(context).textTheme.titleLarge,
                    progress,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${S.of(context).get("tasksDone")} - $counter',
                  style: TextStyle.lerp(
                      Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontSize: 16),
                      Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontSize: 0),
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
