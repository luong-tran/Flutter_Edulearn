import 'package:edu_learn_app/untils/colors.dart';
import 'package:flutter/material.dart';

import '../../../common/wigets/common_widgets.dart';
import 'widgets/detail_widgets.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderBackApp(),
              buildHeaderParagraph(),
              buildRatingAndSub(),
              buildVideoLesson(),
              buildListLesson(context),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                height: 1,
                color: AppColors.secondaryColor,
              ),
              buildToolsInformation(),
              buildAboutClass(),
              buildTableKeypoint(),
              buildTableBenefit(),
              buildAuthorInfo(),
              const SizedBox(
                height: 32,
              ),
              buildSocialMedia()
            ],
          ),
        ),
      ),
    );
  }
}
