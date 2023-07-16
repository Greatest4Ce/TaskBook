import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/domain/state/tasks_state.dart';
import 'package:to_do_list_new/internal/app.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => TasksState())],
        child: Consumer<TasksState>(
          builder: (context, value, child) => App(),
        )),
  );
}
