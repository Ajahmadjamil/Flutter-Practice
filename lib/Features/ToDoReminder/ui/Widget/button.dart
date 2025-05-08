import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/ToDoReminder/Themes/Themes.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final double width;
  final double height;

  const MyButton(
      {super.key,
      required this.label,
      required this.onTap,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryClr,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
