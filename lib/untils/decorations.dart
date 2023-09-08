import 'package:edu_learn_app/untils/colors.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  static BoxDecoration boxDecorationPrimary = BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      boxShadow: [
        BoxShadow(
            spreadRadius: 0,
            blurRadius: 30,
            color: AppColors.primaryColor.withOpacity(0.4),
            offset: const Offset(0, 15))
      ]);
}
