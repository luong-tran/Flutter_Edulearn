import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../untils/colors.dart';
import '../../../../untils/texts.dart';
import 'video_lession.dart';

Widget buildHeaderParagraph() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    margin: const EdgeInsets.only(top: 16, bottom: 31),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Mastering UI/UX Design',
          style: TextStyle(
            fontSize: 23,
            fontFamily: 'PlusJakartaSans-Bold',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: AppColors.headSecondaryColor,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          'Application History in the World',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'PlusJakartaSans-Bold',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: AppColors.headSecondaryColor,
          ),
        ),
      ],
    ),
  );
}

Widget buildRatingAndSub() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    margin: const EdgeInsets.only(bottom: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Free',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'PlusJakartaSans-Medium',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: AppColors.headSecondaryColor,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
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
            const SizedBox(
              width: 5,
            ),
            const Text(
              '(3,647)',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'PlusJakartaSans-Medium',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: AppColors.headSecondaryColor,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget buildVideoLesson() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    margin: const EdgeInsets.only(top: 16, bottom: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Preview class',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'PlusJakartaSans-Medium',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: AppColors.hintTextColor,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        VideoApp()
      ],
    ),
  );
}

Widget buildListLesson(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              '10 lessons',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'PlusJakartaSans-Medium',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: AppColors.hintTextColor,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              '(1 hour 25 min)',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'PlusJakartaSans-Medium',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: AppColors.hintTextColor,
              ),
            ),
          ],
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            padding: const EdgeInsets.only(top: 16),
            itemBuilder: (context, index) {
              return _btnLecture(index);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1,
              mainAxisSpacing: 16,
              mainAxisExtent: 68,
            )),
        const SizedBox(
          height: 35,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/payment_detail');
          },
          child: Container(
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
              child: Text('Buy class - Rp0',
                  style: AppTextStyles.buttonTextPrimary),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _btnLecture(int index) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                color: Color(0xFFFDE0B0),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Icon(
              Icons.play_arrow_outlined,
              color: AppColors.primaryColor,
              size: 16,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              'Lecture ${index + 1}',
              style: const TextStyle(
                fontSize: 13,
                fontFamily: 'PlusJakartaSans-Medium',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: AppColors.headSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildToolsInformation() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _textParagraph('Tools required'),
      const SizedBox(
        height: 8,
      ),
      SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          itemBuilder: (context, index) {
            return _cardToolInfor(index);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
        ),
      )
    ],
  );
}

Widget _cardToolInfor(int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 12),
          child: SvgPicture.asset('assets/icons/uiux.svg')),
      const SizedBox(
        height: 8,
      ),
      const Text(
        'Figma',
        style: TextStyle(
          fontSize: 13,
          fontFamily: 'PlusJakartaSans-Medium',
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: AppColors.headSecondaryColor,
        ),
      ),
    ],
  );
}

Widget buildAboutClass() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 31,
      ),
      _textParagraph('About class'),
      const SizedBox(
        height: 16,
      ),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: const Text(
            'This class is an early stage to learn more about Application History, when the application was first created, by who the creator was, and why the application was created to the development of the application today.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'PlusJakartaSans-Medium',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: AppColors.headSecondaryColor,
            ),
            textAlign: TextAlign.justify,
          ))
    ],
  );
}

Widget buildTableKeypoint() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 48,
      ),
      _textParagraph('Key point'),
      ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 24, left: 30, right: 30),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _listTilesCustom('Understand why the App.'),
          _listTilesCustom('The essence of App creation.'),
          _listTilesCustom('Application use for human life.'),
          _listTilesCustom(
              "The impact of the application on the civilizations of the world's cultures."),
          _listTilesCustom(
              'Understand the development of applications from time to time.')
        ],
      )
    ],
  );
}

Widget buildTableBenefit() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 48,
      ),
      _textParagraph('Key point'),
      ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 24, left: 30, right: 30),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _listTilesCustom('Lifelong class material.'),
        ],
      )
    ],
  );
}

Widget _listTilesCustom(String title) {
  return ListTile(
    minLeadingWidth: 0,
    minVerticalPadding: 0,
    contentPadding: EdgeInsets.zero,
    leading: const Icon(
      Icons.done_rounded,
      color: AppColors.primaryColor,
      size: 24,
    ),
    title: Text(title),
  );
}

Widget buildAuthorInfo() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _textParagraph('Mentor class'),
      Container(
        padding: const EdgeInsets.only(top: 24, left: 30, right: 30),
        child: const CircleAvatar(
          radius: 48, // Image radius
          backgroundImage: NetworkImage(
              'https://w7.pngwing.com/pngs/186/106/png-transparent-naruto-uzumaki-good-smile-company-nendoroid-action-toy-figures-naruto-cartoon-naruto-uzumaki-thumbnail.png'),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Jacob Jones',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'PlusJakartaSans-Bold',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: AppColors.headSecondaryColor,
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Sr. UI/UX Designer at Malaka Company, SGP.',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'PlusJakartaSans-Regular',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            color: AppColors.headSecondaryColor,
          ),
        ),
      ),
    ],
  );
}

Widget _textParagraph(String text) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'PlusJakartaSans-Medium',
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: AppColors.hintTextColor,
        ),
      ));
}

Widget buildSocialMedia() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: const Text(
            'Get in touch!',
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'PlusJakartaSans-Medium',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              color: AppColors.headSecondaryColor,
            ),
          )),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(top: 16, bottom: 50),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/instagram.svg'),
            const SizedBox(
              width: 8,
            ),
            SvgPicture.asset('assets/icons/tiktok.svg'),
            const SizedBox(
              width: 8,
            ),
            SvgPicture.asset('assets/icons/youtube.svg')
          ],
        ),
      )
    ],
  );
}
