import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractices/generated/assets.dart';

class SetStateScreen extends StatefulWidget {
  const SetStateScreen({super.key});

  @override
  State<SetStateScreen> createState() => _SetStateScreenState();
}

class _SetStateScreenState extends State<SetStateScreen> {
  bool isSignIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Image.asset(
            isSignIn ? Assets.setStateLogo : Assets.setStateSignUpLogo,
            height: 40,
          ),
          actions: [
          isSignIn == true
              ? TextButton(onPressed: () {}, child: const Text("SignIn"))
              : TextButton(onPressed: () {}, child: const Text("SignUp"))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          isSignIn == true
              ? const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "SignIn to Account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                )
              : const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "SignUp into Account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                isSignIn? Assets.setStateLoginEmote:Assets.setStateSignup
                , height: 400),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {
              if (isSignIn == false) {
                isSignIn = true;
              } else {
                isSignIn = false;
              }
              setState(() {
                if (kDebugMode) {
                  print("state is being set");
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSignIn ? Colors.grey: Colors.blueAccent,
                ),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.setStateGoogle),
                    const SizedBox(width: 10),
                    Text(
                      isSignIn ? "Sign in with Google" : "Sign up with Google",
                      style: const TextStyle(
                        color:  Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
