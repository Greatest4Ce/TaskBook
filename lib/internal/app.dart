import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/routes/navigation_manager.dart';
import 'package:to_do_list_new/domain/routes/navigation_observer.dart';
import 'package:to_do_list_new/domain/routes/route_names.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/presentation/screens/homepage.dart';

import '../presentation/styles/themes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Themes themes = Themes();

  @override
  void initState() {
    Provider.of<TasksState>(context, listen: false).initDoneCounter();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<TasksState>(context, listen: false).initVisibleList;
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru', 'RU')],
      themeMode: ThemeMode.light,
      theme: themes.lightTheme,
      darkTheme: themes.darkTheme,
      initialRoute: RouteNames.home,
      routes: RoutesBuilder.routes,
      navigatorKey: NavigationManager.instance.key,
    );
  }
}
