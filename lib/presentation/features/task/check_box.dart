import 'package:flutter/material.dart';
import 'package:to_do_list_new/presentation/styles/icons.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final String importance;
  final bool status;
  const CustomCheckBox(
      {Key? key, required this.status, required this.importance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status) {
      return Container(
        height: 18,
        width: 18,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: LightColors.green, borderRadius: BorderRadius.circular(3)),
        child: CustomIcons.check,
      );
    } else if (importance == 'important') {
      return Container(
        height: 18,
        width: 18,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: LightColors.red.withOpacity(0.2),
            border: Border.all(color: LightColors.red, width: 2),
            borderRadius: BorderRadius.circular(3)),
      );
    } else {
      return Container(
        height: 18,
        width: 18,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: LightColors.gray, width: 2),
            borderRadius: BorderRadius.circular(3)),
      );
    }
  }
}
