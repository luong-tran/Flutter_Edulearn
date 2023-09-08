import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../untils/colors.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_event.dart';
import 'bloc/signup_state.dart';
import 'widgets/reusable_textfield.dart';
import 'widgets/sign_up_widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with WidgetsBindingObserver {
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isPhoneNumberValid = false;

  bool _isKeyboardVisible = false;
  final Duration animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final bottomInset = WidgetsBinding.instance!.window.viewInsets.bottom;
    setState(() {
      _isKeyboardVisible = bottomInset > 0;
    });
  }

  //void
  void _emitterValid(SignUpStates state) {
    if (state is IsInValidEmail) {
      _isEmailValid = true;
    } else if (state is IsValidEmail) {
      _isEmailValid = false;
    }

    if (state is IsInValidPassword) {
      _isPasswordValid = true;
    } else if (state is IsValidPassword) {
      _isPasswordValid = false;
    }

    if (state is IsInValidPhone) {
      _isPhoneNumberValid = true;
    } else if (state is IsValidPhone) {
      _isPhoneNumberValid = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpStates>(
      listener: (context, state) {
        _emitterValid(state);
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: AnimatedContainer(
              duration: animationDuration,
              child: SingleChildScrollView(
                  primary: true,
                  reverse: false,
                  physics: _isKeyboardVisible
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20),
                  child: SafeArea(
                      child: Column(
                    children: [
                      buildHeaderSignUp(context),
                      const SizedBox(height: 8),
                      buildParagraphHeader(),
                      const SizedBox(
                        height: 40,
                      ),
                      SignUpReusableTextField(
                          hintText: "Full Name",
                          iconName: Icons.person_outline_rounded,
                          textType: SignUpType.otherField,
                          valid: false,
                          buttonName: "fullName",
                          onChanged: (value) {}),
                      const SizedBox(height: 20),
                      SignUpReusableTextField(
                          hintText: "Education",
                          iconName: Icons.school_outlined,
                          textType: SignUpType.dropField,
                          valid: false,
                          buttonName: "education",
                          onChanged: (value) {}),
                      const SizedBox(height: 20),
                      SignUpReusableTextField(
                          hintText: "Gender",
                          iconName: Icons.transgender_outlined,
                          textType: SignUpType.dropField,
                          valid: false,
                          buttonName: "gender",
                          onChanged: (value) {}),
                      const SizedBox(height: 20),
                      SignUpReusableTextField(
                          hintText: "Email",
                          iconName: Icons.email_outlined,
                          textType: SignUpType.signInField,
                          valid: _isEmailValid,
                          buttonName: "email",
                          onChanged: (value) {
                            context.read<SignUpBloc>().add(EmailEvent(value));
                          }),
                      const SizedBox(height: 20),
                      SignUpReusableTextField(
                          hintText: "Phone Number",
                          iconName: Icons.local_phone_outlined,
                          textType: SignUpType.otherField,
                          valid: _isPhoneNumberValid,
                          buttonName: "phoneNumber",
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .add(PhoneNumberEvent(value));
                          }),
                      const SizedBox(height: 20),
                      SignUpReusableTextField(
                          hintText: "Password",
                          iconName: Icons.lock_outlined,
                          textType: SignUpType.signInField,
                          valid: _isPasswordValid,
                          buttonName: "password",
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .add(PasswordEvent(value));
                          }),
                      const SizedBox(height: 30),
                      buildSignUpButton("Create Account", () {}, true)
                    ],
                  ))),
            ),
          ),
        );
      },
    );
  }
}
