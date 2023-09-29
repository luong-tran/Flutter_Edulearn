import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../untils/colors.dart';
import 'bloc/onboarding_bloc.dart';
import 'bloc/onboarding_event.dart';
import 'bloc/onboarding_state.dart';
import 'widgets/onboarding_wigets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<OnboardBloc, OnboardStates>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 50.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<OnboardBloc>(context).add(OnboardEvents());
                },
                children: [
                  pageOnboarding(
                      1,
                      context,
                      'Next',
                      'Find a field that you like',
                      'There are many fields that you can find here, and you can learn all of them',
                      'assets/images/onboarding_1.png',
                      pageController),
                  pageOnboarding(
                      2,
                      context,
                      'Next',
                      'Start your journey',
                      'You can start your journey in the field you love, no need to be afraid of getting lost, we will help you reach the finish line',
                      'assets/images/onboarding_2.png',
                      pageController),
                  pageOnboarding(
                      3,
                      context,
                      'Get Started',
                      'You can be anything, the world is in your hands',
                      'By learning & increasing knowledge you will become a wise person and can change things around you and even the world',
                      'assets/images/onboarding_3.png',
                      pageController),
                ],
              ),
              Positioned(
                bottom: 50.h,
                child: DotsIndicator(
                  position: state.page,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: const DotsDecorator(
                    color: AppColors.secondaryColor,
                    activeColor: AppColors.primaryColor,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
