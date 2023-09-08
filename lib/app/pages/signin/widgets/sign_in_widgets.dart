import 'package:edu_learn_app/untils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../untils/colors.dart';

enum ButtonSignInType { signIn, thirdParty }

Widget buildHeaderSignIn(BuildContext context) {
  void _onTap() {
    Navigator.of(context).pushNamed("/sign_up");
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
            "Sign up",
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
        "Welcome back!",
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
        "Nice to see you back, you can log in and continue your learning progress",
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyTextRegular,
      )
    ],
  );
}

Widget buildForgotPassword(BuildContext context) {
  return Align(
    alignment: Alignment.bottomRight,
    child: GestureDetector(
      onTap: () {
        print("Have not route yet");
      },
      child: const Text(
        "Forgot password?",
        style: TextStyle(
            fontSize: 13,
            fontFamily: "PlusJakartaSans-Medium",
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal),
      ),
    ),
  );
}

Widget buildLoginAndThirtParty(ButtonSignInType buttonType, String buttonName,
    void Function()? func, bool onSuccess) {
  void _onTap() {
    onSuccess ? func!() : null;
  }

  switch (buttonType) {
    case ButtonSignInType.signIn:
      return GestureDetector(
        onTap: _onTap,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              color:
                  onSuccess ? AppColors.primaryColor : AppColors.secondaryColor,
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
    case ButtonSignInType.thirdParty:
      return Container(
        height: 55,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            border: Border.all(color: AppColors.secondaryColor)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Sign in with", style: AppTextStyles.bodyTextMedium),
              const SizedBox(width: 16),
              SizedBox(
                child: buttonName == "Facebook"
                    ? SvgPicture.asset("assets/icons/facebook.svg")
                    : SvgPicture.asset("assets/icons/google.svg"),
              )
            ]),
      );
  }
}

Widget buildLineSpacer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const <Widget>[
      Expanded(child: Divider(color: Colors.black)),
      Expanded(
          child: Text("Or",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyTextMedium)),
      Expanded(child: Divider(color: Colors.black))
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
