import 'package:edu_learn_app/untils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../untils/colors.dart';

enum SignInType { email, password }

class ReusableTextField extends StatefulWidget {
  final String hintText;
  final IconData iconName;
  final SignInType textType;
  final bool valid;
  final void Function(String value) onChanged;

  const ReusableTextField(
      {Key? key,
      required this.hintText,
      required this.iconName,
      required this.textType,
      required this.valid,
      required this.onChanged})
      : super(key: key);

  @override
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _focusNode;
  bool _showError = false;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      // _showError = !widget.valid && (widget.textType == SignInType.password) ||
      //     !widget.valid && (widget.textType == SignInType.email);
      if (widget.textType == SignInType.email) {
        _showError = !widget.valid;
      } else if (widget.textType == SignInType.password) {
        _showError = _passwordController.text.length < 5;
      }
    });
  }

  void _handleShowAndHidePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = _showError ? Colors.red : AppColors.secondaryColor;
    return Container(
      height: 50.h,
      padding: const EdgeInsets.only(left: 22, right: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
            height: 24.w,
            child: Icon(widget.iconName, color: AppColors.iconColorPrimary),
          ),
          Flexible(
            child: TextField(
              // textInputAction: TextInputAction.continueAction,
              onChanged: (value) {
                widget.onChanged(value);
                _handleFocusChange();
              },
              controller: widget.textType == SignInType.email
                  ? _emailController
                  : _passwordController,
              keyboardType: TextInputType.multiline,
              focusNode: _focusNode,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                hintText: widget.hintText,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: AppTextStyles.hintTextPrimary,
                errorText: _showError
                    ? "${widget.textType == SignInType.password ? "Password" : "Email"} is invalid"
                    : null,
              ),
              style: AppTextStyles.bodyTextField,
              // autocorrect: false,
              obscureText: !_showPassword
                  ? widget.textType == SignInType.password
                  : false,
            ),
          ),
          widget.textType == SignInType.password
              ? SizedBox(
                  width: 24.w,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: !_showPassword
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.iconColorPrimary,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: AppColors.iconColorPrimary,
                          ),
                    onPressed: _handleShowAndHidePassword,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
