import 'package:dotted_border/dotted_border.dart';
import 'package:edu_learn_app/data/models/payment_model.dart';
import 'package:edu_learn_app/untils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../untils/colors.dart';

Widget buildHeadTitle(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    margin: const EdgeInsets.only(top: 16, bottom: 32),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 23,
        fontFamily: 'PlusJakartaSans-Bold',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: AppColors.headSecondaryColor,
      ),
    ),
  );
}

Widget buildTitle(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontFamily: 'PlusJakartaSans-Medium',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: AppColors.hintTextColor,
      ),
    ),
  );
}

Widget buildCardDiscount(String? text) {
  return Container(
      margin: const EdgeInsets.only(top: 16, left: 30, right: 30),
      child: DottedBorder(
        color: AppColors.primaryColor,
        strokeWidth: 1,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [10, 5, 10, 5, 10, 5],
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 40,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text ?? "",
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'PlusJakartaSans-Bold',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: AppColors.primaryColor,
                ),
              )),
        ),
      ));
}

Widget buildCardCode(String? text) {
  return Container(
      margin: const EdgeInsets.only(top: 16, left: 30, right: 30),
      child: DottedBorder(
        color: AppColors.buttonTextSecondaryColor,
        strokeWidth: 1,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [10, 5, 10, 5, 10, 5],
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.buttonTextSecondaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text ?? "",
              style: const TextStyle(
                fontSize: 13,
                fontFamily: 'PlusJakartaSans-Bold',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: AppColors.buttonTextSecondaryColor,
              ),
            ),
          ),
        ),
      ));
}

Widget buildCardPayment(String title) {
  String getImageForTitle(String title) {
    final payment = listPayment.firstWhere(
      (payment) => payment.title == title,
      orElse: () =>
          const Payment(id: 0, title: '', image: ''), // Default Payment object.
    );

    return payment.image;
  }

  return Container(
    margin: const EdgeInsets.only(top: 16, left: 30, right: 30),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
              color: title == "ShopeePay"
                  ? const Color(0xfff0592c)
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child:
              SvgPicture.asset("assets/icons/${getImageForTitle(title)}.svg"),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'PlusJakartaSans-Medium',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: AppColors.hintTextColor,
          ),
        ),
      ],
    ),
  );
}

enum SheetType { typeOne, typeTwo }

class GestureListSheet extends StatefulWidget {
  final void Function(String title) onChange;
  final String title;
  final SheetType type;
  final List<dynamic> dynamicList;
  const GestureListSheet(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.type,
      required this.dynamicList})
      : super(key: key);

  @override
  State<GestureListSheet> createState() => _GestureListSheetState();
}

class _GestureListSheetState extends State<GestureListSheet> {
  void onChanged(String title) {
    widget.onChange(title);
  }

  Future<void> _showBottom() {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  widget.title,
                  style: AppTextStyles.titleCard,
                ),
              ),
              Container(
                child: _buildUISheetType(
                    context, widget.type, widget.dynamicList, onChanged),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildUISheetType(BuildContext context, SheetType type,
      List<dynamic> list, void Function(String title) onChange) {
    switch (type) {
      case SheetType.typeOne:
        return Wrap(
            children: list
                .map((f) => _buildCellTypeOne(
                      context,
                      f,
                      onChange,
                    ))
                .toList());
      case SheetType.typeTwo:
        return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _buildCellTypeTwo(context, index, onChange);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.0,
              mainAxisSpacing: 16.0,
              mainAxisExtent: 30,
            ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBottom();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          margin: const EdgeInsets.only(top: 16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          height: 21,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'PlusJakartaSans-Regular',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: AppColors.headSecondaryColor,
                  ),
                ),
              ),
              const Icon(Icons.navigate_next_rounded)
            ],
          )),
    );
  }
}

Widget _buildCellTypeOne(BuildContext context, dynamic something,
    void Function(String title) onChange) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      margin:
          const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.thirdColor),
        borderRadius: const BorderRadius.all(
            Radius.circular(10.0) //                 <--- border radius here
            ),
      ),
      child: Text(
        something is Discount ? something.title : "${something.code}",
        style: const TextStyle(
          color: AppColors.headSecondaryColor,
          fontSize: 16.0,
        ),
      ),
    ),
    onTap: () {
      something is Discount
          ? onChange("Discount " + something.title)
          : onChange(something.code);
      Navigator.of(context).pop();
    },
  );
}

Widget _buildCellTypeTwo(
    BuildContext context, int index, void Function(String title) onChange) {
  return GestureDetector(
    onTap: () {
      onChange(listPayment[index].title);
      Navigator.of(context).pop();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
              color: index == 0 ? const Color(0xfff0592c) : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child:
              SvgPicture.asset("assets/icons/${listPayment[index].image}.svg"),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Text(
            listPayment[index].title,
            style: AppTextStyles.bodyTextRegular,
          ),
        ),
      ],
    ),
  );
}

Widget buildLine() {
  return Container(
    width: double.infinity,
    height: 1,
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
    color: AppColors.secondaryColor,
  );
}

Widget buildTextTile(String tit, String subTit) {
  return Container(
    margin: const EdgeInsets.only(left: 30, right: 30, top: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tit,
          style: AppTextStyles.bodyTextField,
        ),
        Text(
          subTit,
          style: AppTextStyles.bodyTextField,
        )
      ],
    ),
  );
}

Widget buildButton(bool valid, void Function() func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: const EdgeInsets.only(right: 30, left: 30, top: 120),
      height: 55,
      decoration: BoxDecoration(
          color: valid ? AppColors.primaryColor : AppColors.secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: valid
                    ? AppColors.primaryColor.withOpacity(0.4)
                    : AppColors.secondaryColor.withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 15))
          ]),
      child: const Center(
        child: Text("Pay now", style: AppTextStyles.buttonTextPrimary),
      ),
    ),
  );
}

Widget buildButtonSuccess(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigator.of(context)
      //     .pushNamedAndRemoveUntil("/application", (route) => false);
      Navigator.of(context).popUntil((route) => route.isFirst);
    },
    child: Container(
      margin: const EdgeInsets.only(right: 30, left: 30, top: 120),
      height: 55,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 15))
          ]),
      child: const Center(
        child: Text("Go to Home", style: AppTextStyles.buttonTextPrimary),
      ),
    ),
  );
}
