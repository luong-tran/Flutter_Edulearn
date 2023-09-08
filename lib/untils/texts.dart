import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 23,
    fontFamily: 'PlusJakartaSans-Bold',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.primaryColor,
  );

  static const TextStyle subHeadLine = TextStyle(
    fontSize: 16,
    fontFamily: 'PlusJakartaSans-Bold',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.primaryColor,
  );

  static const TextStyle headSecondary = TextStyle(
    fontSize: 13,
    fontFamily: 'PlusJakartaSans-Bold',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.headSecondaryColor,
  );

  static const TextStyle subHeadSecondary = TextStyle(
    fontSize: 10,
    fontFamily: 'PlusJakartaSans-Regular',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.headSecondaryColor,
  );

  static const TextStyle titleCard = TextStyle(
    fontSize: 16,
    fontFamily: 'PlusJakartaSans-Bold',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  static const TextStyle bodyTextRegular = TextStyle(
    fontSize: 14,
    fontFamily: 'PlusJakartaSans-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColors.iconColorPrimary,
  );

  static const TextStyle bodyTextMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'PlusJakartaSans-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    color: AppColors.iconColorPrimary,
  );

  static const TextStyle bodyTextField = TextStyle(
    fontSize: 14,
    fontFamily: 'PlusJakartaSans-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle hintTextPrimary = TextStyle(
    fontSize: 14,
    fontFamily: 'PlusJakartaSans-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    color: AppColors.hintTextColor,
  );

  static const TextStyle buttonTextPrimary = TextStyle(
    fontSize: 18,
    fontFamily: 'PlusJakartaSans-Bold',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: AppColors.backgroundColor,
  );

  static const TextStyle buttonTextSecondary = TextStyle(
    fontSize: 18,
    fontFamily: 'PlusJakartaSans-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    color: AppColors.buttonTextSecondaryColor,
  );
}
