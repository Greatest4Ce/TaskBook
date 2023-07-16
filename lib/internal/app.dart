import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/s.dart';
import 'package:to_do_list_new/domain/routes/navigation_manager.dart';
import 'package:to_do_list_new/domain/routes/route_names.dart';
import 'package:to_do_list_new/domain/state/tasks_state_mobx.dart';
import '../domain/routes/navigation_logger.dart';
import '../presentation/styles/themes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Themes themes = Themes();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<TasksState>(create: (_) => TasksState())],
      child: Consumer<TasksState>(
        builder: (_, store, __) => MaterialApp(
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          navigatorObservers: [NavigationLogger()],
          themeMode: ThemeMode.system,
          theme: themes.lightTheme,
          darkTheme: themes.darkTheme,
          initialRoute: RouteNames.splashScreen,
          routes: RoutesBuilder.routes,
          navigatorKey: NavigationManager.instance.key,
        ),
      ),
    );
  }
}
