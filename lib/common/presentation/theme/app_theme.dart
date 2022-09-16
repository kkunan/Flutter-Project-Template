import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_buttons.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_text_theme.dart';

mixin AppTheme {
  static final light = ThemeData.light().copyWith(
    textTheme: AppTextTheme.main,
    primaryColor: AppColor.darkCerulean,
    backgroundColor: AppColor.darkCerulean,
    highlightColor: AppColor.peachOrange,
    dialogBackgroundColor: AppColor.white,
  );
}