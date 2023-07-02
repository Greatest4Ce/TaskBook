import 'package:flutter/material.dart';
import 'package:to_do_list_new/s.dart';
import 'package:to_do_list_new/domain/routes/navigation_manager.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class NewTaskWIdget extends StatelessWidget {
  const NewTaskWIdget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => NavigationManager.instance.openTaskScreen(),
      title: Text(
        S.of(context).get("new"),
        style: CustomTextTheme.body.copyWith(color: LightColors.gray),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 52, vertical: 0),
    );
  }
}
