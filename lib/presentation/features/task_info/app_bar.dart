import 'package:flutter/material.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/icons.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

// ignore: must_be_immutable
class TaskInfoAppBar extends AppBar {
  String saveText;
  void Function() backOnPressed;
  void Function() saveOnPressed;
  TaskInfoAppBar(
      {Key? key,
      required this.saveText,
      required this.backOnPressed,
      required this.saveOnPressed})
      : super(
            key: key,
            iconTheme: const IconThemeData(color: Colors.red),
            elevation: 0,
            leading: IconButton(
                splashRadius: 20,
                icon: CustomIcons.close,
                onPressed: backOnPressed),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: LightColors.gray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                    ),
                    padding: const EdgeInsets.only(
                      left: 13,
                      right: 13,
                    ),
                  ),
                  onPressed: saveOnPressed,
                  child: Text(
                    saveText,
                    style: CustomTextTheme.button.copyWith(color: Colors.blue),
                  ))
            ]);
}
