import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../untils/colors.dart';
import '../../../../../untils/texts.dart';
import '../../../category/data/models/category_model.dart';
import '../../data/models/class_model.dart';

Widget buildWelcomeContainer() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(45)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.primaryColor.withOpacity(0.6),
          AppColors.primaryColor,
        ],
        stops: const [0.1576, 1.0],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _alertContainer(),
        _paragraphContainer(),
        _searchBoxContainer(),
      ],
    ),
  );
}

Widget _searchBoxContainer() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: AppColors.backgroundColor,
    ),
    child: Row(
      children: [
        SizedBox(
          width: 24.w,
          height: 24.w,
          child: const Icon(Icons.search_outlined,
              color: AppColors.iconColorPrimary),
        ),
        Flexible(
          child: TextField(
            onChanged: (value) {
              print(value); // Handle error display while typing
            },
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Find class',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              hintStyle: AppTextStyles.hintTextPrimary,
            ),
            style: AppTextStyles.bodyTextField,
          ),
        ),
        SizedBox(
          width: 24.w,
          height: 24.w,
          child: const Icon(Icons.mic_none_rounded,
              color: AppColors.iconColorPrimary),
        )
      ],
    ),
  );
}

Widget _paragraphContainer() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Hello, Cyndy!',
          style: AppTextStyles.buttonTextPrimary,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Find the class or field you like here',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'PlusJakartaSans-Medium',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: AppColors.backgroundColor,
          ),
        )
      ],
    ),
  );
}

Widget _alertContainer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _logoEduLearn(),
      GestureDetector(
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xFFFCD695),
          ),
          child: const Icon(
            Icons.notifications_outlined,
            size: 20,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}

Widget _logoEduLearn() {
  return Row(
    children: [
      SizedBox(
        width: 36,
        height: 36,
        child: Image.asset('assets/images/logo_2.png'),
      ),
      const SizedBox(
        width: 8,
      ),
      const Text(
        'EduLearn',
        style: TextStyle(
            fontSize: 23,
            fontFamily: 'PlusJakartaSans-Bold',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: Colors.white),
      )
    ],
  );
}

Widget buildCategories(String title, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Text(
          title,
          style: AppTextStyles.titleCard,
        ),
      ),
      Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: _buildGridCategory(context))
    ],
  );
}

Widget _buildGridCategory(BuildContext context) {
  return Center(
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, i) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/category');
            },
            child: _cardCategory(categories[i]));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 32,
        mainAxisExtent: 104,
      ),
    ),
  );
}

Widget _cardCategory(Category category) {
  return Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFEF5E5),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(
                'assets/icons/${category.image}.svg',
                fit: BoxFit.none,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              category.title,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'PlusJakartaSans-Bold',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    ],
  );
}

enum SubTypeCategory { classCategory, subClassCategory }

Widget buildSubCategory(
    String title, SubTypeCategory subType, List<dynamic> list) {
  return Column(
    children: [_headerSubCategory(title), _listSubCategory(subType, list)],
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
              'See more',
              style: AppTextStyles.subHeadLine,
            ),
          )
        ],
      ));
}

Widget _listSubCategory(SubTypeCategory subType, List<dynamic> list) {
  switch (subType) {
    case SubTypeCategory.classCategory:
      return SizedBox(
        height: 247,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _cardClassCategory(index);
          },
          separatorBuilder: (context, index) {
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
            return _cardSubClassCategory(index);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
        ),
      );
  }
}

Widget _cardClassCategory(int index) {
  return Container(
    width: 176,
    margin: index == 0 ? const EdgeInsets.only(left: 30) : null,
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: AppColors.secondaryColor)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/icons/${catClass[index].image}.svg',
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
                    child: Text('12 Class',
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
                  child: Text('3 Level',
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Center(
            child: Text('Start journey',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'PlusJakartaSans-Bold',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: AppColors.backgroundColor,
                )),
          ),
        )
      ],
    ),
  );
}

Widget _cardSubClassCategory(int index) {
  return Container(
    width: 176,
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
              'assets/images/${catSubClass[index].image}.png',
            ),
          ),
        ),
        Text(catSubClass[index].title, style: AppTextStyles.headSecondary),
        const Text('Free', style: AppTextStyles.subHeadSecondary),
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
              itemSize: 15,
            ),
            const SizedBox(width: 8),
            const Text('(1,125)',
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
