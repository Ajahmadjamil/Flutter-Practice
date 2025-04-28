
import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Screens/BaseScreen.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Screens/LoginScreen.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Utils/Constants.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Utils/SharedPref.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      checkUserLogin(context);
    })
    ;
        super.initState();
  }

  void checkUserLogin(BuildContext context) async {
    SharedPref sharedPref = SharedPref();
    String token = await sharedPref.getBearerToken();
    Constants.token= token;

    if (token.isEmpty) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BaseScreen()),
            (route) => false,
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4E9F5),
      body: Center(
        child: Image.asset(
          "assets/applogo.png", // Ensure the path is correct
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
