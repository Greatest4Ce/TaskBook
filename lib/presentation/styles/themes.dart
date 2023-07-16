import 'package:flutter/material.dart';
import 'package:to_do_list_new/presentation/styles/custom_text_theme.dart';
import 'package:to_do_list_new/presentation/styles/dark_colors.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class Themes {
  ThemeData get lightTheme => ThemeData(
      backgroundColor: LightColors.backgroundColor,
      listTileTheme: const ListTileThemeData(
          tileColor: LightColors.backSecondary,
          contentPadding: EdgeInsets.symmetric(horizontal: 19, vertical: 0),
          horizontalTitleGap: -2,
          minVerticalPadding: 17),
      textTheme: const TextTheme(
        titleLarge: CustomTextTheme.largeTitle,
        titleMedium: CustomTextTheme.body,
        bodyMedium: CustomTextTheme.body,
      ),
      scaffoldBackgroundColor: LightColors.backgroundColor,
      appBarTheme: const AppBarTheme(
          titleTextStyle: CustomTextTheme.largeTitle,
          centerTitle: false,
          titleSpacing: 60,
          elevation: 0,
          color: LightColors.backgroundColor));
  ThemeData get darkTheme => ThemeData(
        listTileTheme: const ListTileThemeData(
          tileColor: DarkColors.backSecondary,
        ),
        textTheme: TextTheme(
            titleMedium: CustomTextTheme.body.copyWith(color: Colors.white)),
        scaffoldBackgroundColor: DarkColors.backgroundColor,
        appBarTheme: AppBarTheme(
            titleTextStyle:
                CustomTextTheme.largeTitle.copyWith(color: Colors.white),
            centerTitle: false,
            titleSpacing: 60,
            elevation: 0,
            color: DarkColors.backgroundColor),
      );
}
