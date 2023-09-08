import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../untils/colors.dart';
import '../../../../untils/texts.dart';

Widget buildHeaderSignUp(BuildContext context) {
  void _onTap() {
    Navigator.of(context).pop();
  }

  return Container(
    padding: const EdgeInsets.only(bottom: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logoEduLearn(),
        GestureDetector(
          onTap: _onTap,
          child: const Text(
            "Sign in",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'PlusJakartaSans-Bold',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildParagraphHeader() {
  return Column(
    children: const [
      Text(
        "Sign up",
        style: TextStyle(
            fontSize: 23,
            fontFamily: 'PlusJakartaSans-Bold',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: AppColors.primaryColor),
      ),
      SizedBox(
        height: 16,
      ),
      Text(
        "The point of your journey together is here, start registering now",
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyTextRegular,
      )
    ],
  );
}

Widget _logoEduLearn() {
  return Row(
    children: [
      SizedBox(
        width: 36,
        height: 36,
        child: SvgPicture.asset("assets/images/logo.svg"),
      ),
      const SizedBox(
        width: 8,
      ),
      Text(
        "EduLearn",
        style: TextStyle(
            fontSize: 23,
            fontFamily: 'PlusJakartaSans-Bold',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: Colors.black.withOpacity(0.8)),
      )
    ],
  );
}

Widget buildSignUpButton(
    String buttonName, void Function()? func, bool onSuccess) {
  void _onTap() {
    onSuccess ? func!() : null;
  }

  return GestureDetector(
    onTap: _onTap,
    child: Container(
      height: 45.h,
      decoration: BoxDecoration(
          color: onSuccess ? AppColors.primaryColor : AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          boxShadow: [
            BoxShadow(
                color: onSuccess
                    ? AppColors.primaryColor.withOpacity(0.4)
                    : AppColors.secondaryColor.withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 15))
          ]),
      child: Center(
        child: Text(buttonName, style: AppTextStyles.buttonTextPrimary),
      ),
    ),
  );
}
