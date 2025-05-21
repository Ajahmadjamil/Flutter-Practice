import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Api/ApiServices.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Model/LoginResponse.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Utils/SharedPref.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'BaseScreen.dart';
import '../Utils/Constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  late LoginResponse loginResponse;
  var sharedPrefs = SharedPref();

  // @override
  // void initState() {
  //   isUserCheck();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xffe3e9f5),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(14, 85, 14, 8),
                child: Image(
                  image: AssetImage("assets/login.png"),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              // alignment: FractionalOffset.bottomCenter,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 64),
                child: Column(
                  children: [
                    const Text(
                      "Login Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'fonts/inter_semi_bold_600'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'fonts/inter_regular_400'),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Colors.blue)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Colors.grey)),
                              hintText: "Enter Email Address",
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'fonts/inter_regular_400'),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.blue)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintText: "Enter Password",
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                            child: InkWell(
                              onTap: () {
                                loginUser(context);
                              },
                              child: Container(
                                height: 48,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    color: Colors.blue),
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontFamily: "fonts/inter_regular_400",
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xffe3e9f5),
    );
  }



  Future<void> loginUser(BuildContext context) async {
    // setLoginLoading(true);
    try {
      String emails= email.text.toString();
      String pass = password.text.toString();
      await ApiServices()
          .login(email: emails, password: pass)
          .then((response) async {

        if (response.statusCode == 200) {
          loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
          if (kDebugMode) {
            print('res:::${loginResponse.data}');
          }
          if (loginResponse.success == true) {
            Constants.token = loginResponse.data?.token;
            await sharedPrefs.setLoginResponse(jsonEncode(loginResponse.toJson()));
            sharedPrefs.setBearerToken(loginResponse.data!.token.toString());

            print("API Response: ${sharedPrefs.getLoginResponse()}");
            Fluttertoast.showToast(
              msg: "User Logged in Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BaseScreen()),
            );
          } else {
            Fluttertoast.showToast(
              msg: "success false ${loginResponse.errorMessage}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        } else {
          Fluttertoast.showToast(
            msg: "something went wrong ${response.statusCode}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: "something went wrong 2${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

}
