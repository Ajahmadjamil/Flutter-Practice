
import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/ChoosePlan/utils/AppColors.dart';

Widget richTextWidget({required String text1, required String text2}) {
  return RichText(
    text: TextSpan(children: [
      TextSpan(
        text: text1,
        style: const TextStyle(color: Colors.black, fontSize: 20,
        fontFamily: "Nunito",
        fontWeight: FontWeight.w700),
      ),
      TextSpan(
        text: text2,
        style: TextStyle(
            color: AppColors.textColorPrimary,
            fontSize: 20,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w700,
           ),
      ),
    ]),
  );
}
