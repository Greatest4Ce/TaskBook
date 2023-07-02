import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_new/domain/state/connection_status.dart';
import 'package:to_do_list_new/domain/state/tasks_state_mobx.dart';
import 'package:to_do_list_new/internal/app.dart';
import 'package:to_do_list_new/internal/logger/logger.dart';

GetIt getIt = GetIt.instance;
ConnectionStatus connectionStatus = ConnectionStatus.getInstance();
void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    getIt.registerLazySingleton(() => TasksState());
    connectionStatus.initialize();
    runApp(
      const App(),
    );
  }, (error, stackTrace) {
    log(
      error.toString(),
      error: error,
      stackTrace: stackTrace,
    );
    logger.e('main: $error');
  });
}
