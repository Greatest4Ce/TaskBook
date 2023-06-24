// import 'package:to_do_list_new/domain/state/tasks_state.dart';

import '../../domain/state/tasks_state_mobx.dart';

class TasksModule {
  static TasksState tasksState() {
    return TasksState();
  }
}
