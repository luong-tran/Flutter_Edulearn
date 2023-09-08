import 'package:edu_learn_app/data/models/class_model.dart';
import 'package:edu_learn_app/untils/colors.dart';
import 'package:edu_learn_app/untils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ViewType { gridView, listView }
enum SubTypeCategory { classCategory, subClassCategory }

Widget buildSegmentedPicker(void Function(String?)? onChanged, String setValue,
    List<String> segmentes) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    margin: const EdgeInsets.only(top: 16),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _titleSegmented(),
      _pickerDropDown(onChanged, setValue, segmentes)
    ]),
  );
}

Widget _titleSegmented() {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.only(right: 16),
        child: const Text(
          "Design",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'PlusJakartaSans-Bold',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: AppColors.headSecondaryColor,
          ),
        ),
      ),
      SizedBox(
        width: 24,
        height: 24,
        child: SvgPicture.asset("assets/icons/pen_calendar.svg"),
      )
    ],
  );
}

Widget _pickerDropDown(void Function(String?)? onChanged, String setValue,
    List<String> segmentes) {
  return Container(
    width: 120,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor),
        borderRadius: BorderRadius.circular(10)),
    child: DropdownButton<String>(
      isExpanded: true,
      value: setValue,
      onChanged: onChanged,
      items: segmentes
          .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppTextStyles.headSecondary,
                    ),
                  ))
          .toList(),

      // add extra sugar..
      icon: Container(
          margin: const EdgeInsets.only(left: 8),
          child: const Icon(Icons.expand_more_sharp)),
      iconSize: 16,
      underline: const SizedBox(),
      dropdownColor: Colors.white,
      elevation: 2,
      style: AppTextStyles.headSecondary,
    ),
  );
}

///SubTypeCategory

Widget buildSubCategory(
    String title, SubTypeCategory subType, List<dynamic> list) {
  return Column(
    children: [_headerSubCategory(title), _listSubCategory(subType, list)],
  );
}

Widget buildGridSubCategory(
    String title, SubTypeCategory subType, List<dynamic> list) {
  return Column(
    children: [_headerSubCategory(title), _gridSubCategory(subType, list)],
  );
}

Widget _headerSubCategory(String title) {
  return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.titleCard,
          ),
          GestureDetector(
            child: const Text(
              "See more",
              style: AppTextStyles.subHeadLine,
            ),
          )
        ],
      ));
}

Widget _listSubCategory(SubTypeCategory subType, List<dynamic> list) {
  void _onTap(BuildContext context) {
    Navigator.of(context).pushNamed("/detail");
  }

  switch (subType) {
    case SubTypeCategory.classCategory:
      return SizedBox(
        height: 247,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          padding: const EdgeInsets.only(left: 30, right: 30),
          itemBuilder: (context, index) {
            return _cardClassCategory(index, ViewType.listView, context);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 16);
          },
        ),
      );
    case SubTypeCategory.subClassCategory:
      return SizedBox(
        height: 196,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          padding: const EdgeInsets.only(left: 30, right: 30),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  _onTap(context);
                },
                child: _cardSubClassCategory(index, ViewType.listView));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 16);
          },
        ),
      );
      {}
  }
}

Widget _gridSubCategory(SubTypeCategory subType, List<dynamic> list) {
  void _onTap(BuildContext context) {
    Navigator.of(context).pushNamed("/detail");
  }

  switch (subType) {
    case SubTypeCategory.classCategory:
      return SizedBox(
          child: GridView.builder(
              padding: const EdgeInsets.only(left: 30, right: 30),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return _cardClassCategory(index, ViewType.gridView, context);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                mainAxisExtent: 247,
              )));
    case SubTypeCategory.subClassCategory:
      return SizedBox(
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            padding: const EdgeInsets.only(left: 30, right: 30),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    _onTap(context);
                  },
                  child: _cardSubClassCategory(index, ViewType.gridView));
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              mainAxisExtent: 196,
            )),
      );
      {}
  }
}

/// ViewType

Widget _cardClassCategory(int index, ViewType type, BuildContext context) {
  return Container(
    width: type == ViewType.listView ? 176 : null,
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: AppColors.secondaryColor)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/icons/${catClass[index].image}.svg",
          fit: BoxFit.none,
        ),
        Text(
          catClass[index].title,
          style: AppTextStyles.titleCard,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.thirdColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(8),
                  child: const Center(
                    child: Text("12 Class",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'PlusJakartaSans-Bold',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: AppColors.iconColorPrimary,
                        )),
                  )),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.thirdColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(8),
                child: const Center(
                  child: Text("3 Level",
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'PlusJakartaSans-Bold',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: AppColors.iconColorPrimary,
                      )),
                ),
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/detail");
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Center(
              child: Text("Start journey",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'PlusJakartaSans-Bold',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: AppColors.backgroundColor,
                  )),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _cardSubClassCategory(int index, ViewType type) {
  return Container(
    width: type == ViewType.listView ? 176 : null,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: AppColors.secondaryColor)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Center(
            child: Image.asset(
              "assets/images/${catSubClass[index].image}.png",
            ),
          ),
        ),
        Text(catSubClass[index].title, style: AppTextStyles.headSecondary),
        const Text("Free", style: AppTextStyles.subHeadSecondary),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBarIndicator(
              direction: Axis.horizontal,
              rating: 5,
              itemBuilder: (context, index) => const Icon(
                Icons.star_rounded,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 15.0,
            ),
            const SizedBox(width: 8),
            const Text("(1,125)",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'PlusJakartaSans-Medium',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: AppColors.headSecondaryColor,
                )),
          ],
        )
      ],
    ),
  );
}
