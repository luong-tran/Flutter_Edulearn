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
  final List<String> _segmentes = [
    "Filter",
    'Roadmap',
    'Premium',
    'Popular',
    'Freemium'
  ];
  String _setSelected = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setSelected = _segmentes[0];
  }

  void _handleSetSeleted(String? value) {
    setState(() {
      _setSelected = value!;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _setViewCategory() {
    return _setSelected == "Filter"
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
            _setSelected == "Roadmap" ? "Roadmap" : _setSelected,
            _setSelected == "Roadmap"
                ? SubTypeCategory.classCategory
                : SubTypeCategory.subClassCategory,
            _setSelected == "Roadmap" ? catClass : catSubClass);
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
              buildSegmentedPicker(_handleSetSeleted, _setSelected, _segmentes),
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
