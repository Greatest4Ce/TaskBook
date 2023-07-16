
import 'package:flutter/material.dart';

import '../../domain/state/tasks_state_mobx.dart';
import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _tasksState = getIt<TasksState>();

  @override
  initState() {
    super.initState();

    _tasksState.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
