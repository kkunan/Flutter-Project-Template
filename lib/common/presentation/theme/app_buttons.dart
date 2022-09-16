import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_text_theme.dart';

class PrimaryButton extends ElevatedButton {
  PrimaryButton({super.key, required super.onPressed, required super.child})
      : super(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ).copyWith(
            minimumSize: State.all(const Size(200, 50)),
            elevation: State.all(4),
            textStyle:
            State.all<TextStyle>(AppTextTheme.button),
            padding: State.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 16, horizontal: 32)),
            backgroundColor: State.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppColor.lightSilver;
                } else {
                  return AppColor.darkCerulean;
                }
              },
            ),
          ),
        );
}

typedef State = MaterialStateProperty;