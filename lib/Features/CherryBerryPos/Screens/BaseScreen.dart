
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Screens/HomeScreen.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Screens/ProfileScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  bool isAddWidgetVisible = false;

  List<Widget> screenList = [
    HomeScreen(),
    AddWidget(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenList[currentIndex],

          if (isAddWidgetVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isAddWidgetVisible = false;

                  });
                },
                child: Container(
                  color: Colors.transparent, // Background dim
                  child: Center(child: AddWidget()),
                ),
              ),
            ),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            setState(() {
              isAddWidgetVisible = !isAddWidgetVisible;
            });
          } else {
            setState(() {
              currentIndex = index;
              isAddWidgetVisible = false; // Hide AddWidget when switching screens
            });
          }
        },
        selectedItemColor: Colors.blue,
        currentIndex: currentIndex,

        items: [

          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              isAddWidgetVisible
                  ? "assets/icons/ic_selected_add.svg"
                  : "assets/icons/ic_add.svg",
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// Overlay Widget
class AddWidget extends StatelessWidget {
  const AddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        child: SizedBox(
          width: 192,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                              msg: "takeAway",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                          child: Container(
                              child: SelectOrderTypeContainer(
                                  "assets/icons/ic_takeaway.svg",
                                  "Take Away"))),
                      SizedBox(height: 16),
                      InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "dine In",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          child: Container(
                              child: SelectOrderTypeContainer(
                                  "assets/icons/ic_dinein.svg", "Dine In"))),
                      SizedBox(height: 16),
                      InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                              msg: "delivery",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                          child: Container(
                              child: SelectOrderTypeContainer(
                                  "assets/icons/ic_delivery.svg", "Delivery"))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SelectOrderTypeContainer(String iconPath, String text) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Color(0xff402EB5).withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color:Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}













