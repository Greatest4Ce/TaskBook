import 'dart:developer';

import 'package:flutter/material.dart';

class NavigationLogger extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    log('NavigationLogger.didPush:  ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('NavigationLogger.didPop:  ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log('NavigationLogger.didReplace:  ${newRoute?.settings.name}');
  }
}
