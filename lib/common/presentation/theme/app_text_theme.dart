import 'package:flutter/material.dart';

import 'app_colors.dart';

mixin AppTextTheme {
  static final main = TextTheme(
    headline1: TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.bold,
      fontSize: 30
    ),
    subtitle1: TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.bold,
        fontSize: 16
    ),
    headline2: TextStyle(color: AppColor.black,
        fontWeight: FontWeight.bold,
        fontSize: 24
    ),
    bodyText1: TextStyle(
        color: AppColor.black,
        fontSize: 16
    ),
    caption: TextStyle(
        color: AppColor.black,
        fontSize: 14
    ),
  );

  static const button = TextStyle(
      color: AppColor.white,
      fontWeight: FontWeight.bold,
      fontSize: 20
  );
}