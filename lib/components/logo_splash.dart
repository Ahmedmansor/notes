import 'package:flutter/material.dart';

class LogoSplash extends StatelessWidget {
  const LogoSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 200,
          height: 200,
        ),
        const Text(
          "Notes App",
          style: TextStyle(fontFamily: "sigmar", fontSize: 20),
        ),
      ],
    );
  }
}
