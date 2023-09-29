import '../../../../untils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../untils/colors.dart';

enum SignUpType { signInField, otherField, dropField }

class SignUpReusableTextField extends StatefulWidget {
  final String hintText;
  final IconData iconName;
  final SignUpType textType;
  final String buttonName;
  final bool valid;
  final void Function(String value) onChanged;

  const SignUpReusableTextField(
      {Key? key,
      required this.hintText,
      required this.iconName,
      required this.textType,
      required this.valid,
      required this.buttonName,
      required this.onChanged})
      : super(key: key);

  @override
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<SignUpReusableTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _showError = false;
  bool _showPassword = false;
  Object? _selectedValue;
  List<String>? _items;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);

    _items = widget.hintText == 'Gender'
        ? ['Male', 'Female', 'Other']
        : ['University', 'School', 'Other'];
  }

  void _handleFocusChange() {
    switch (widget.textType) {
      case SignUpType.signInField:
        setState(() {
          _showError = !widget.valid && (widget.buttonName == 'password') ||
              !widget.valid && (widget.buttonName == 'email');
        });
        break;
      case SignUpType.otherField:
        setState(() {
          _showError = !widget.valid && (widget.buttonName == 'phoneNumber');
        });
        break;
      case SignUpType.dropField:
        break;
    }
  }

  void _handleShowAndHidePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _showError ? Colors.red : AppColors.secondaryColor;
    switch (widget.textType) {
      case SignUpType.otherField:
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
                  controller: _controller,
                  onChanged: (value) {
                    widget.onChanged(
                        value); // Call the provided onChanged callback
                    _handleFocusChange(); // Handle error display while typing
                  },
                  focusNode: _focusNode,
                  keyboardType: widget.buttonName == 'phoneNumber'
                      ? TextInputType.number
                      : TextInputType.multiline,
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
                    errorText:
                        _showError ? '${widget.hintText} is invalid' : null,
                  ),
                  style: AppTextStyles.bodyTextField,
                ),
              ),
            ],
          ),
        );
      case SignUpType.signInField:
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
                  controller: _controller,
                  onChanged: (value) {
                    widget.onChanged(
                        value); // Call the provided onChanged callback
                    _handleFocusChange(); // Handle error display while typing
                  },
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
                    errorText:
                        _showError ? '${widget.hintText} is invalid' : null,
                  ),
                  style: AppTextStyles.bodyTextField,
                  autocorrect: false,
                  obscureText:
                      !_showPassword ? widget.buttonName == 'password' : false,
                ),
              ),
              if (widget.buttonName == 'password')
                SizedBox(
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
              else
                Container()
            ],
          ),
        );
      case SignUpType.dropField:
        return Container(
          height: 50.h,
          padding: const EdgeInsets.only(left: 22, right: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            border: Border.all(color: AppColors.secondaryColor),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: DropdownButtonFormField(
                      value: _selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },
                      items: _items?.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: AppTextStyles.hintTextPrimary,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                      icon: const Icon(Icons.expand_more_outlined,
                          color: AppColors.iconColorPrimary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}
