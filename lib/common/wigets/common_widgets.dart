import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../untils/colors.dart';

class HeaderBackApp extends StatelessWidget {
  const HeaderBackApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_backButtonHeader(context), _logoEduLearn()]),
    );
  }
}

Widget _backButtonHeader(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: const SizedBox(
        width: 20,
        height: 20,
        child: Icon(
          Icons.chevron_left_sharp,
          color: AppColors.iconColorPrimary,
        ),
      ),
    ),
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
