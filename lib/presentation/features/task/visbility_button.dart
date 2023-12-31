import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list_new/presentation/styles/icons.dart';

import '../../../domain/state/tasks_state_mobx.dart';
import '../../../main.dart';

class VisibilityButton extends StatelessWidget {
  const VisibilityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksState = getIt<TasksState>();
    return SafeArea(
      child: Observer(
        builder: (_) => tasksState.isLoading
            ? const SizedBox()
            : SizedBox(
                height: 40,
                width: 50,
                child: IconButton(
                    splashRadius: 3,
                    onPressed: () {
                      tasksState.changeVisibleAll();
                    },
                    icon: tasksState.tasks == []
                        ? CustomIcons.visibility
                        : tasksState.visibleAll
                            ? CustomIcons.visibilityoff
                            : CustomIcons.visibility),
              ),
      ),
    );
  }
}
