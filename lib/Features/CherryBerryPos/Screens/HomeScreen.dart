import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../generated/assets.dart';
import '../Api/ApiServices.dart';
import '../Model/GetOrdersResponse.dart';
import '../Utils/Constants.dart';
import '../Widgets/OrderHistoryRow.dart';
import '../Widgets/TagsRow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchDoc = TextEditingController();
  late GetOrdersResponse getOrdersResponse;
  List<Data> listsData=[];

  @override
  Widget build(BuildContext context) {

    List<String> tags = [
      "All",
      "DineIn",
      "TakeAway",
      "Delivery",
      "Paid",
      "Unpaid"
    ];

    return Scaffold(
      backgroundColor: const Color(Constants.colorBg),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [

            Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Container(child: TagsListss(tags: tags)),
                  ),
                  SizedBox(width: 8),
                  SvgPicture.asset(Assets.iconsIcSearch)


                ],
              ),


            ]),
            Expanded(
              child: listsData.isEmpty
                  ? const Center(child: Text("No Order Found"))
                  : ListsWithOrders(listsData: listsData),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getOrderOfBranch(context);
  }

  Future<void> getOrderOfBranch(BuildContext context) async {
    try {
      await ApiServices()
          .getOrderOfBranch()
          .then((response) {
        if (response.statusCode == 200) {
          getOrdersResponse = GetOrdersResponse.fromJson(jsonDecode(response.body));
          if (getOrdersResponse.success == true) {
            setState(() {
              listsData = getOrdersResponse.data;
            });


            Fluttertoast.showToast(
              msg: "getOrderOfBranch Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );

          } else {
            Fluttertoast.showToast(
              msg: getOrdersResponse.message.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        } else if (response.statusCode == 401) {
          // Clear the token
        Constants.expireSession(context);
         Constants.makeToast("Session has been Expired");
        } else{
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
        msg: "getOrderOfBranch failed",
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

class ListsWithOrders extends StatelessWidget {
  final List<Data> listsData;

  const ListsWithOrders({super.key, required this.listsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: OrderHistoryRow(listsData: listsData),
    );
  }
}


class TagsListss extends StatelessWidget {
  final List<String> tags;

  const TagsListss({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return TagsRow(tags: tags); // No need for a Scaffold here
  }



}
