import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Screens/LoginScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'SharedPref.dart';

class Constants {
  static const String currency = "\$";
  static  String? token;
  static const int colorBlue= 0xff8240F0;
  static const int colorBgGrey= 0xffF5F5F5;
  static const int colorFadeText= 0xff8D909A;
  static const int colorBorder= 0xffD1D3D7;
  static const int colorBg= 0xffE4E9F5;


  static void expireSession(BuildContext context){
    var sharedPref = SharedPref();
    String token = "";
    sharedPref.setBearerToken(token);
    Constants.token = "";


    sharedPref.setLoginResponse("");

    // Navigate to LoginScreen and remove all previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
    );
  }


 static void makeToast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


}