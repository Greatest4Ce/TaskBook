import 'package:flutter/material.dart';
import 'package:to_do_list_new/internal/dependencies/locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final tasksState = Locator.tasksState;

  @override
  initState() {
    super.initState();
    tasksState.getTasks();
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
