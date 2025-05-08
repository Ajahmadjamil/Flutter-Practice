import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterpractices/Features/ToDoReminder/NotificationServices/NotifyHelper.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);
const Color white = Colors.white;

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: white,
    ),
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkGreyClr,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkGreyClr,
    ),
  );
}

//get keyword means return me something
TextStyle get subHeadingStyle {
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400]:Colors.grey
    ),
  );
}

  TextStyle get headingStyle {
    return GoogleFonts.lato (
      textStyle: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
}

TextStyle getBoldStyle({double fontSize = 14, required Color color}) {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color
    ),
  );
}

  TextStyle get getTitleStyle{
    return  GoogleFonts.lato (
      textStyle:  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode?Colors.white:Colors.black
      ),
    );}
    TextStyle get getSubTitleStyle{
      return  GoogleFonts.lato (
        textStyle:  TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Get.isDarkMode?Colors.grey[100]:Colors.grey[600]
        ),
      );
}
