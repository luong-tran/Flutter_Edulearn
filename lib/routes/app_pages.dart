import 'package:edu_learn_app/app/pages/payment/bloc/payment_bloc.dart';
import 'package:edu_learn_app/app/pages/payment/success/payment_success.dart';
import 'package:edu_learn_app/app/pages/profile/bloc/profile_bloc.dart';
import 'package:edu_learn_app/app/pages/profile/proflie_page.dart';
import 'package:edu_learn_app/data/repositories/category_repository.dart';
import 'package:edu_learn_app/data/repositories/profile_respository.dart';
import 'package:edu_learn_app/data/repositories/sign_in_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/pages/application/application.dart';
import '../app/pages/application/bloc/app_blocs.dart';
import '../app/pages/category/bloc/category_bloc.dart';
import '../app/pages/category/bloc/category_event.dart';
import '../app/pages/category/category_page.dart';
import '../app/pages/detail/bloc/detail_bloc.dart';
import '../app/pages/detail/detail_page.dart';
import '../app/pages/onboarding/bloc/onboarding_bloc.dart';
import '../app/pages/onboarding/onboarding_page.dart';
import '../app/pages/payment/detail/payment_detail.dart';
import '../app/pages/signin/bloc/signin_bloc.dart';
import '../app/pages/signin/sign_in_page.dart';
import '../app/pages/signup/bloc/signup_bloc.dart';
import '../app/pages/signup/sign_up_page.dart';
import 'app_names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.ONBOARDING,
        page: const OnboardingPage(),
        bloc: BlocProvider(create: (_) => OnboardBloc()),
      ),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignInPage(),
          bloc: BlocProvider(create: (_) => SignInBloc(SignInRepository()))),
      PageEntity(
        route: AppRoutes.SIGN_UP,
        page: const SignUpPage(),
        bloc: BlocProvider(create: (_) => SignUpBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.PROFILE,
        page: ProfilePage(),
        bloc: BlocProvider(create: (_) => ProfileBloc(ProfileRepository())),
      ),
      PageEntity(
        route: AppRoutes.CATEGORY,
        page: const CategoryPage(),
        bloc: BlocProvider(
            create: (_) =>
                CategoryBloc(CategoryRepository())..add(LoadCategoryEvent())),
      ),
      PageEntity(
        route: AppRoutes.DETAIL,
        page: const DetailPage(),
        bloc: BlocProvider(create: (_) => DetailBloc()),
      ),
      PageEntity(
        route: AppRoutes.PAYMENT_DETAIL,
        page: const PaymentDetailPage(),
        bloc: BlocProvider(create: (_) => PaymentBloc()),
      ),
      PageEntity(
        route: AppRoutes.PAYMENT_SUCCESS,
        page: const PaymentSuccess(),
        bloc: BlocProvider(create: (_) => PaymentBloc()),
      )
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }

    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        print("valid route name ${settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const OnboardingPage(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
