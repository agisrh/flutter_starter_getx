import 'package:flutter/material.dart';
import 'style_helper.dart';

class BorderStyles {
  static const OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: AppColors.form, width: 1),
  );

  static const OutlineInputBorder enableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: AppColors.form, width: 1),
  );

  static OutlineInputBorder focusBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: AppColors.primary, width: 1),
  );

  static OutlineInputBorder errorBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.red, width: 1),
  );
}
