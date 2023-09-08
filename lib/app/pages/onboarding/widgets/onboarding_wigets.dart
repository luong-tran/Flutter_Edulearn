import 'package:edu_learn_app/untils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../untils/colors.dart';

Widget pageOnboarding(
    int index,
    BuildContext context,
    String buttonName,
    String title,
    String subtitle,
    String imagePath,
    PageController pageController) {
  double width = MediaQuery.of(context).size.height;
  return Container(
    padding: EdgeInsets.only(left: 30.w, right: 30.w),
    child: Column(
      children: [
        SizedBox(
          width: width <= 667 ? 200.w : 300.w,
          height: width <= 667 ? 200.w : 300.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 230.h,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.h),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyTextRegular,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonName != "Get Started"
                  ? Flexible(
                      child: _buttonOnboard("Skip", () {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.decelerate);
                    }, pageController))
                  : Container(),
              buttonName != "Get Started"
                  ? const SizedBox(
                      width: 16,
                    )
                  : Container(),
              Flexible(
                  child: _buttonOnboard(buttonName, () {
                if (index < 3) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                } else {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/sign_in", (route) => false);
                }
              }, pageController)),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buttonOnboard(
    String buttonName, void Function()? func, PageController pageController) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: 55,
      decoration: BoxDecoration(
          color: buttonName == "Next" || buttonName == "Get Started"
              ? AppColors.primaryColor
              : AppColors.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          boxShadow: buttonName == "Next" || buttonName == "Get Started"
              ? [
                  BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 30,
                      offset: const Offset(0, 15))
                ]
              : null),
      child: buttonName == "Next"
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(buttonName,
                    style: buttonName == "Next" || buttonName == "Get Started"
                        ? AppTextStyles.buttonTextPrimary
                        : AppTextStyles.buttonTextSecondary),
                buttonName != "Get Started"
                    ? const SizedBox(
                        width: 14,
                      )
                    : Container(),
                buttonName != "Get Started"
                    ? const Icon(Icons.east_rounded,
                        color: AppColors.backgroundColor, size: 21)
                    : Container()
              ],
            )
          : Center(
              child: Text(buttonName,
                  style: buttonName == "Next" || buttonName == "Get Started"
                      ? AppTextStyles.buttonTextPrimary
                      : AppTextStyles.buttonTextSecondary),
            ),
    ),
  );
}
