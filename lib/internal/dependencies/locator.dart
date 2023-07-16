import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_new/data/local_storage/repository/local_tasks_data_repository.dart';
import 'package:to_do_list_new/data/server/repository/tasks_data_repository.dart';
import 'package:to_do_list_new/domain/repository/locals_tasks_repository.dart';
import 'package:to_do_list_new/domain/repository/tasks_reporsitory.dart';
import 'package:to_do_list_new/domain/state/connection_status.dart';
import 'package:to_do_list_new/domain/state/tasks_state_mobx.dart';
import 'package:to_do_list_new/firebase_options.dart';
import 'package:to_do_list_new/internal/dependencies/api_module.dart';
import 'package:to_do_list_new/internal/dependencies/local_storage_module.dart';
import 'package:to_do_list_new/internal/logger/logger.dart';

abstract class Locator {
  static final _locator = GetIt.instance;

  static FirebaseAnalytics get analytics => FirebaseAnalytics.instance;

  static TasksRepository get tasksRepository => _locator<TasksRepository>();
  static LocalTasksRepository get localTasksRepository =>
      _locator<LocalTasksRepository>();
  static TasksState get tasksState => _locator<TasksState>();
  static ConnectionStatus get connectionStatus => _locator<ConnectionStatus>();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();
    _initCrashlytics();

    WidgetsFlutterBinding.ensureInitialized();
    _locator.registerSingleton<TasksRepository>(
        TasksDataRepository(ApiModule.apiUtil()));
    _locator.registerSingleton<LocalTasksRepository>(
        LocalTasksDataRepository(LocalStorageModule.localStorageUtil()));
    _locator.registerSingleton<TasksState>(TasksState());
    _locator.registerSingleton(ConnectionStatus.getInstance());
    connectionStatus.initialize();
  }

  static Future<void> _initFirebase() async {
    logger.v('Firebase initialization started');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    logger.v('Firebase initialized');
  }

  static void _initCrashlytics() {
    FlutterError.onError = (errorDetails) {
      logger.v('Caught error in FlutterError.onError');
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      logger.v('Caught error in PLatfrormDisparcher.onError');
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    logger.v('Crashlytics initialized');
  }

  static Future<void> dispose() async {}
}
