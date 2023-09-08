import 'package:flutter/material.dart';

import '../../../data/models/class_model.dart';
import 'widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildWelcomeContainer(),
              buildCategories("Explore categories", context),
              buildSubCategory("Roadmap you might like",
                  SubTypeCategory.classCategory, catClass),
              buildSubCategory("Freemium class",
                  SubTypeCategory.subClassCategory, catSubClass),
              buildSubCategory("Popular class",
                  SubTypeCategory.subClassCategory, catSubClass),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
