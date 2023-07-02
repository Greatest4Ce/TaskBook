import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_new/domain/state/connection_status.dart';
import 'package:to_do_list_new/domain/state/tasks_state_mobx.dart';
import 'package:to_do_list_new/internal/app.dart';

GetIt getIt = GetIt.instance;
ConnectionStatus connectionStatus = ConnectionStatus.getInstance();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton(() => TasksState());
  connectionStatus.initialize();
  runApp(
    const App(),
  );
}
