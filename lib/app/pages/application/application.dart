import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../untils/colors.dart';
import 'bloc/app_blocs.dart';
import 'bloc/app_events.dart';
import 'bloc/app_states.dart';
import 'widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppBloc>().add(const TriggerAppEvent(0));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: Scaffold(
          body: buildPage(state.index),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.secondaryColor.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (value) {
                    context.read<AppBloc>().add(TriggerAppEvent(value));
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryColor,
                  unselectedItemColor: AppColors.iconColorPrimary,
                  items: [
                    BottomNavigationBarItem(
                      label: 'home',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: const Icon(Icons.home_rounded),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'profile',
                      icon: SizedBox(
                          width: 15.w,
                          height: 15.h,
                          child: const Icon(Icons.person_rounded)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
