import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../untils/colors.dart';
import '../../../../../untils/texts.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import '../widgets/profile_menu_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// -- IMAGE
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                              image: NetworkImage(
                                  'https://w7.pngwing.com/pngs/186/106/png-transparent-naruto-uzumaki-good-smile-company-nendoroid-action-toy-figures-naruto-cartoon-naruto-uzumaki-thumbnail.png'),
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.backgroundColor),
                          child: const Icon(
                            Icons.pending,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Name', style: AppTextStyles.titleCard),
                  const SizedBox(height: 10),
                  Text('email@gmail.com',
                      style: Theme.of(context).textTheme.bodyText2),
                  const SizedBox(height: 20),

                  /// -- BUTTON
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 200,
                    height: 40,
                    child: const Center(
                      child:
                          Text('Edit Profile', style: AppTextStyles.titleCard),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),

                  /// -- MENU
                  ProfileMenuWidget(
                      title: 'Settings', icon: Icons.settings, onPress: () {}),
                  ProfileMenuWidget(
                      title: 'Billing Details',
                      icon: Icons.wallet_giftcard,
                      onPress: () {}),
                  ProfileMenuWidget(
                      title: 'User Management',
                      icon: Icons.verified_user,
                      onPress: () {}),
                  const Divider(),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                      title: 'Information', icon: Icons.info, onPress: () {}),
                  ProfileMenuWidget(
                      title: 'Logout',
                      icon: Icons.logout,
                      textColor: Colors.red,
                      endIcon: false,
                      onPress: () {
                        context.read<ProfileBloc>().add(SignOutEvent(context));
                      }),
                  const SizedBox(height: 10),
                  if (state is SignOutErrorState)
                    Text(state.error?.message ?? '')
                  else
                    Container(),
                  if (state is SignOutLoadingState)
                    const CircularProgressIndicator()
                  else
                    Container()
                ],
              ),
            ),
          );
        }));
  }
}
