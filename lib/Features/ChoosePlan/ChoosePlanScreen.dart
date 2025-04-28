import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/ChoosePlan/Widgets/ChoosePlanWidget.dart';

import 'Widgets/RichTextWidget.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen({super.key});

  @override
  State<ChoosePlanScreen> createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  @override
  Widget build(BuildContext context) {
    int isFreePlan =1;
    int isMostPopular = 0;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 54, left: 12, right: 12),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(),
                richTextWidget(
                  text1: 'Choose Your ',
                  text2: 'Plan',
                ),
                const SizedBox(height: 8),
                const Text(
                  "Whether you're just getting started or ready to go deeper, we’re here for you every step of the way.",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),)
              ],
            ),
            Padding(padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child:ChoosePlanWidget(isFreePlan: isFreePlan,
              isMostPopular: isMostPopular),
            )

          ],
        ),)
      ,
    );
  }
}
