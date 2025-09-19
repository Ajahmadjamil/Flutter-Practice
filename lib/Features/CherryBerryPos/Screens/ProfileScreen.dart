import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Model/LoginResponse.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Utils/SharedPref.dart';
import 'package:flutterpractices/generated/assets.dart';


class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var sharedPref = SharedPref();
  late LoginResponse loginResponse;
  List<Map<String, dynamic>> data = [
    {
      "item": "Product 1",
      "quantity": 2,
      "price": 25.99,
      "total": 51.98,
    },
    {
      "item": "Product 2",
      "quantity": 1,
      "price": 49.99,
      "total": 49.99,
    },
    {
      "item": "Product 3",
      "quantity": 3,
      "price": 10.00,
      "total": 30.00,
    },
    {
      "item": "Product 4",
      "quantity": 1,
      "price": 15.50,
      "total": 15.50,
    },
  ];


  @override
  void initState() {
    init();
    super.initState();
  }
  bool isLoading = false;

  init() async {
    setState(() {
      isLoading = true;
    });
    await sharedPref.getLoginResponse().then((val) {
      print('val:::$val');
      if (val != '') {
        loginResponse = LoginResponse.fromJson(jsonDecode(val));
      }

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE8F5), // Light Blue background
      body:
      isLoading?
          Container()
          :
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF6B50FF), // Purple button
                    child: SvgPicture.asset(Assets.iconsIcBack),
                  ),
                ),
                SizedBox(width: 16),
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person, size: 40, color: Colors.black),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.logout, color: Colors.red),
                      onPressed: () {
                        // Add Logout Functionality
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ProfileItem(
                    title: "Name", value: "${loginResponse.data?.name}"),
                ProfileItem(
                    title: "Email", value: "${loginResponse.data?.username}"),
                ProfileItem(
                    title: "Restaurant Name",
                    value: "${loginResponse.data?.restaurantName}"),
                const ProfileItem(title: "Branch Name", value: ""),
                ProfileItem(
                    title: "Role", value: "${loginResponse.data?.rolename}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;

  const ProfileItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value.isNotEmpty ? value : "-",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),


        ],
      ),
    );
  }
}
