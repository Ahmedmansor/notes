import 'package:flutter/material.dart';
import 'package:group_35_notes_app/components/default_text_form_field.dart';
import 'package:group_35_notes_app/controllers/cache_helper.dart';
import 'package:group_35_notes_app/screens/home_screen.dart';
import 'package:group_35_notes_app/utils/app_settings.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeData.dark().primaryColorDark,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            height: AppSettings.height,
            width: AppSettings.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildForm(),
                _buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _checkLogin() {
    if (emailController.text == CacheHelper.getData(key: "email")) {
      if (passwordController.text == CacheHelper.getData(key: "password")) {
        CacheHelper.saveData(key: "login", value: true);

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login successfully")));
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const HomeScreen(),
                type: PageTransitionType.leftToRightWithFade));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Password is invalid")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email is invalid")));
    }
  }

  Widget _buildButtons() {
    return Column(
      children: [
        _buildSpace(15),
        MaterialButton(
          onPressed: () {
            _checkLogin();
          },
          minWidth: AppSettings.width,
          color: Colors.white,
          textColor: Colors.black,
          height: 55,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: const Text(
            "Login",
            style: TextStyle(
              fontFamily: "sigmar",
            ),
          ),
        ),
        SizedBox(
          width: AppSettings.width,
          child: TextButton(
              onPressed: () {
                _createAccount();
              },
              child: const Text(
                "Create Account",
                style: TextStyle(fontFamily: "sigmar", color: Colors.white),
              )),
        ),
      ],
    );
  }

  _createAccount() {
    CacheHelper.saveData(key: "email", value: emailController.text);
    CacheHelper.saveData(key: "password", value: passwordController.text);

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Created Successfully")));

    emailController.text = "";
    passwordController.text = "";
  }

  Widget _buildForm() {
    return Column(
      children: [
        DefaultTextFormField(
          hintText: "Email or Phone number",
          controller: emailController,
        ),
        _buildSpace(3),
        DefaultTextFormField(
          hintText: "Password",
          controller: passwordController,
        ),
        _buildSpace(1),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "Forget Password?",
              style: TextStyle(fontFamily: "sigmar", fontSize: 12),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSpace(double prec) {
    return SizedBox(
      height: AppSettings.height * (prec / 100),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSpace(5),
        const Text(
          "Hello,",
          style: TextStyle(fontFamily: "sigmar", fontSize: 30),
        ),
        const Text(
          "Welcome Back",
          style: TextStyle(fontFamily: "sigmar", fontSize: 30),
        ),
        _buildSpace(5),
      ],
    );
  }
}
