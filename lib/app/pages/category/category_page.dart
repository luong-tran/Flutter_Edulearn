import 'package:edu_learn_app/data/models/class_model.dart';
import 'package:flutter/material.dart';

import '../../../common/wigets/common_widgets.dart';
import 'widgets/category_widgets.dart';

enum CategoryState {
  defaultState,
  changeState,
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<String> segmentes = [
    "Filter",
    'Roadmap',
    'Premium',
    'Popular',
    'Freemium'
  ];
  String setSelected = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSelected = segmentes[0];
  }

  void _setSeleted(String? value) {
    setState(() {
      setSelected = value!;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _setViewCategory() {
    return setSelected == "Filter"
        ? _changeCategoryState(CategoryState.defaultState)
        : _changeCategoryState(CategoryState.changeState);
  }

  Widget _changeCategoryState(CategoryState state) {
    switch (state) {
      case CategoryState.defaultState:
        return Column(
          children: [
            buildSubCategory(
                "Roadmap", SubTypeCategory.classCategory, catClass),
            buildSubCategory(
                "Premium class", SubTypeCategory.subClassCategory, catSubClass),
            buildSubCategory(
                "Popular class", SubTypeCategory.subClassCategory, catSubClass),
            buildSubCategory("Freemium class", SubTypeCategory.subClassCategory,
                catSubClass),
          ],
        );
      case CategoryState.changeState:
        return buildGridSubCategory(
            setSelected == "Roadmap" ? "Roadmap" : setSelected,
            setSelected == "Roadmap"
                ? SubTypeCategory.classCategory
                : SubTypeCategory.subClassCategory,
            setSelected == "Roadmap" ? catClass : catSubClass);
    }
  }

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
              buildSegmentedPicker(_setSeleted, setSelected, segmentes),
              _setViewCategory(),
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
