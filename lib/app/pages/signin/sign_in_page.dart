import '../../../untils/colors.dart';
import '../../../untils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/bloc/signin_bloc.dart';
import 'presentation/bloc/signin_event.dart';
import 'presentation/bloc/signin_state.dart';
import 'presentation/widgets/reusable_textfiled.dart';
import 'presentation/widgets/sign_in_widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isLoginButtonEnabled = false;

  void _emitterValid(SignInStates state) {
    if (_isEmailValid && _isPasswordValid) {
      _enableLoginButton();
    } else {
      _disableLoginButton();
    }

    if (state is SignInLoadingState) {
      _disableLoginButton();
    } else if (state is SignInLoadedState || state is SignInErrorState) {
      _enableLoginButton();
    }
  }

  void _enableLoginButton() {
    setState(() {
      _isLoginButtonEnabled = true;
    });
  }

  void _disableLoginButton() {
    setState(() {
      _isLoginButtonEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInStates>(listener: (context, state) {
      _isEmailValid = state.email.isEmailValid();
      _isPasswordValid = state.password.length > 4;
      _emitterValid(state);
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20),
              child: SafeArea(
                  child: Column(
                children: [
                  buildHeaderSignIn(context),
                  const SizedBox(height: 8),
                  buildParagraphHeader(),
                  const SizedBox(height: 47),
                  //Form Sign In
                  ReusableTextField(
                      hintText: 'Email',
                      iconName: Icons.email_outlined,
                      textType: SignInType.email,
                      valid: _isEmailValid,
                      onChanged: (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  ReusableTextField(
                      hintText: 'Password',
                      iconName: Icons.lock_outlined,
                      textType: SignInType.password,
                      valid: _isPasswordValid,
                      onChanged: (value) {
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  buildForgotPassword(context),
                  const SizedBox(
                    height: 20,
                  ),
                  if (state is SignInLoadingState)
                    const CircularProgressIndicator()
                  else
                    Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildLoginAndThirtParty(ButtonSignInType.signIn, 'Log in',
                      () {
                    context.read<SignInBloc>().add(SignInSubmitEvent(
                        state.email, state.password, context));
                  }, _isLoginButtonEnabled),
                  const SizedBox(
                    height: 40,
                  ),
                  buildLineSpacer(),
                  const SizedBox(
                    height: 24,
                  ),
                  buildLoginAndThirtParty(
                      ButtonSignInType.thirdParty, 'Facebook', () {
                    print('AAAA');
                  }, true),
                  const SizedBox(
                    height: 24,
                  ),
                  buildLoginAndThirtParty(ButtonSignInType.thirdParty, 'Google',
                      () {
                    print('AAAA');
                  }, true),
                ],
              ))),
        ),
      );
    });
  }
}
