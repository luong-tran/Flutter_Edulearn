import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/pages/application/application.dart';
import 'app/pages/onboarding/onboarding_page.dart';
import 'injection_container.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
            builder: (context, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: isVisible
                      ? const ApplicationPage()
                      : const OnboardingPage(),
                  onGenerateRoute: AppPages.GenerateRouteSettings,
                )));
  }

  Future checkSignIn() async {
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print(token);
    setState(() {
      isVisible = token != null;
    });
  }
}
