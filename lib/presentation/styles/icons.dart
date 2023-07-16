import 'package:flutter/material.dart';
import 'package:to_do_list_new/presentation/styles/light_colors.dart';

class CustomIcons {
  static const Image add = Image(
    image: AssetImage('assets/icons/add.png'),
    color: LightColors.white,
  );
  static const Image arrowback = Image(
    image: AssetImage('assets/icons/arrow_back.png'),
    color: LightColors.gray,
  );
  static const Image check = Image(
    image: AssetImage('assets/icons/check.png'),
    color: LightColors.white,
  );
  static const Image close = Image(
    image: AssetImage(
      'assets/icons/close.png',
    ),
    color: LightColors.gray,
    height: 20,
    width: 20,
  );
  static const Image delete = Image(
    image: AssetImage('assets/icons/delete.png'),
    color: LightColors.white,
  );
  static const Image infooutline = Image(
    image: AssetImage(
      'assets/icons/info_outline.png',
    ),
    color: LightColors.gray,
  );
  static const Image visibilityoff = Image(
    image: AssetImage('assets/icons/visibility_off.png'),
    color: LightColors.blue,
  );
  static const Image visibility = Image(
    image: AssetImage('assets/icons/visibility.png'),
    color: LightColors.blue,
  );
}
