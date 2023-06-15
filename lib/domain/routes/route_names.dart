import 'package:flutter/material.dart';
import 'package:to_do_list_new/presentation/screens/create_task_screen.dart';
import 'package:to_do_list_new/presentation/screens/homepage.dart';

abstract class RouteNames {
  static const home = '/';
  static const taskScreen = '/taskScreen';
}

abstract class RoutesBuilder {
  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.home: (BuildContext context) => const HomePage(),
    RouteNames.taskScreen: (BuildContext context) => const CreateTaskScreen(),
  };
}
