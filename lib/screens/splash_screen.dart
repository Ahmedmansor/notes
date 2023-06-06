import 'package:flutter/material.dart';
import 'package:group_35_notes_app/controllers/cache_helper.dart';
import 'package:group_35_notes_app/screens/home_screen.dart';
import 'package:group_35_notes_app/screens/login_screen.dart';

import '../components/logo_splash.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/app_settings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Widget _checkLogin() {
    if (CacheHelper.getData(key: "login") != null) {
      if (CacheHelper.getData(key: "login")) {
        return const HomeScreen();
      } else {
        return const LoginScreen();
      }
    } else {
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSettings.init(context);

    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.leftToRightWithFade,
          child: _checkLogin(),
        ),
      );
    });

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          // _buildLogo(),
          LogoSplash(),
          CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      )),
    );
  }

  // Widget _buildLogo() {
  //   return Column(
  //     children: [
  //       Image.asset(
  //         "assets/images/logo.png",
  //         width: 200,
  //         height: 200,
  //       ),
  //       const Text(
  //         "Notes App",
  //         style: TextStyle(fontFamily: "sigmar", fontSize: 20),
  //       ),
  //     ],
  //   );
  // }
}
