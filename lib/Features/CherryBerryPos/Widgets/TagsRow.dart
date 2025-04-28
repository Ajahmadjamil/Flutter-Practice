import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Utils/Constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TagsRow extends StatefulWidget {
  final List<String> tags;

  TagsRow({super.key, required this.tags});

  @override
  _TagsRowState createState() => _TagsRowState();
}

class _TagsRowState extends State<TagsRow> {
  int? selectedIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: widget.tags.length,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index; // Update selected index
                });
                showToast(widget.tags[index]);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(Constants.colorBg) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(
                  //   color: isSelected ? Colors.blue : Colors.transparent,
                  // ),
                ),
                child: Row(
                  children: [
                    Text(
                      widget.tags[index],
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4), // Space between text and number
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFF595E),
                      ),
                      child: Center(
                        child: Text(
                         "0",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showToast(String tag) {
    Fluttertoast.showToast(
      msg: tag,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}