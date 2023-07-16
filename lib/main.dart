import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_list_new/internal/app.dart';
import 'package:to_do_list_new/internal/dependencies/locator.dart';
import 'package:to_do_list_new/internal/logger/logger.dart';

void main() {
  runZonedGuarded(() async {
    await Locator.init();
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
