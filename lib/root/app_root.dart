import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/splash_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
    );
  }
}
