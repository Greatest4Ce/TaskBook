
import 'package:flutter/material.dart';
import 'package:to_do_list_new/domain/routes/navigation_logger.dart';
import 'package:to_do_list_new/domain/routes/route_names.dart';


class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  late final observers = <NavigatorObserver>[
    NavigationLogger(),
  ];

  NavigatorState get _navigator => key.currentState!;

  void openTaskScreen() {
    _navigator.pushNamed(RouteNames.taskScreen);
  }

  void pop() {
    _navigator.pop();
  }

  void backHome() {
    _navigator.popUntil(ModalRoute.withName(RouteNames.home));
  }

  void navigateToHome() {
    _navigator.pushReplacementNamed(RouteNames.home);
  }
}
