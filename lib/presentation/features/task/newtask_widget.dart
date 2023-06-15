import 'package:flutter/material.dart';
import 'package:to_do_list_new/presentation/screens/create_task_screen.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class NewTaskWIdget extends StatelessWidget {
  const NewTaskWIdget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CreateTaskScreen())),
      title: Text(
        'Новое',
        style: CustomTextTheme.body.copyWith(color: LightColors.gray),
      ),
      tileColor: LightColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 52, vertical: 14),
    );
  }
}
