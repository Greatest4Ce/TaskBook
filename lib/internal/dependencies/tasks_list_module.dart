import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/internal/dependencies/repository_module.dart';

class TasksListModule {
  static TasksState tasksListState() {
    return TasksState(
        // RepositoryModule.tasksRepository()
        );
  }
}
