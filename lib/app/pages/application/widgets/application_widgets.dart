import 'package:edu_learn_app/app/pages/profile/presentation/views/proflie_page.dart';
import 'package:flutter/material.dart';

import '../../home/presentation/views/home_page.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    ProfilePage(),
  ];

  return _widget[index];
}
