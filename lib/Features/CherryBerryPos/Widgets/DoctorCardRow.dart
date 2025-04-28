// import 'package:first/Constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'OrderHistory.dart';
// import 'TagsRow.dart';
//
// class DoctorListView extends StatelessWidget {
//   final List<DoctorCard> listsData;
//   int likes = 24;
//   int price = 80;
//   List<String> tags = [
//     "Humanistic Therapy",
//     "DBT",
//     "Cognitive Behavioral Therapy",
//     "Therapy"
//   ];
//
//   DoctorListView({super.key, required this.listsData});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
//       shrinkWrap: true,
//       physics: ScrollPhysics(),
//       itemCount: listsData.length,
//       itemBuilder: (BuildContext context, int index) {
//         return SizedBox(
//           child: Card(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     child: Row(
//                       children: [
//                         SizedBox(
//                             width: 72,
//                             height: 72,
//                             child: Image(
//                                 image: AssetImage("assets/doc_profile.png"))),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "${listsData[index].name}",
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontFamily: 'Nunito',
//                                             fontWeight: FontWeight.w700,
//                                             color: Color(0xff191A1C)),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "${listsData[index].qualification}: ",
//                                             style: TextStyle(
//                                                 fontSize: 14,
//                                                 fontFamily: 'Nunito',
//                                                 fontWeight: FontWeight.w500,
//                                                 color:
//                                                     Color(Constants.colorBlue)),
//                                           ),
//                                           Text(
//                                             "${listsData[index].experience}",
//                                             style: TextStyle(
//                                                 fontSize: 14,
//                                                 fontFamily: 'Nunito',
//                                                 fontWeight: FontWeight.w500,
//                                                 color:
//                                                     Color(Constants.colorBlue)),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                       width: 24,
//                                       height: 24,
//                                       child: SvgPicture.asset(
//                                           "assets/icons/ic_save.svg"))
//                                 ],
//                               ),
//                               // Horizontal Scrollable Tags
//                               SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//
//                                 child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     ...tags.take(2).map((tag) => Padding(
//                                       padding: const EdgeInsets.only(right: 8),
//                                       child: Chip(
//                                         label: Text(tag,
//                                             style: TextStyle(
//                                                 fontSize: 12,
//                                                 fontFamily: 'Nunito',
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Colors.black)
//                                         ),
//                                         backgroundColor:
//                                            Color(Constants.colorBgGrey),
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(4)),
//                                       ),
//                                     )),
//                                     if (tags.length > 2)
//                                       Chip(
//                                         label: Text("+${tags.length - 2}",
//                                             style: TextStyle(
//                                                 fontSize: 12,
//                                                 color: Colors.black)),
//                                         backgroundColor:
//                                         Color(Constants.colorBgGrey),
//
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(4)),
//                                       ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     height: 1,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Next Available",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontFamily: 'Nunito',
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xff191A1C)),
//                             ),
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   width: 14,
//                                   height: 14,
//                                   child: SvgPicture.asset(
//                                       "assets/icons/ic_like.svg"),
//                                 ),
//                                 Text(
//                                   "$likes Ensdored",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontFamily: 'Nunito',
//                                       fontWeight: FontWeight.w500,
//                                       color: Color(0xff191A1C)),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Today",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontFamily: 'Nunito',
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(Constants.colorBlue)),
//                             ),
//                             Text(
//                               "${Constants.currency}$price/60 min",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontFamily: 'Nunito',
//                                   fontWeight: FontWeight.w700,
//                                   color: Color(Constants.colorBlue)),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
// //
// // class TagsLists extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     List<String> tags = [
// //       "Humanistic Therapy",
// //       "DBT",
// //       "Cognitive Behavioral Therapy",
// //       "Therapy"
// //     ];
// //
// //     return Scaffold(
// //       body: TagsRow(tags: tags),
// //     );
// //   }
// // }
//
// // child: Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
// // children: [
// // Text("Name: ${listsData[index].name}",
// // style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // Text("Experience: ${listsData[index].experience}"),
// // Text("Time: ${listsData[index].time}"),
// // ],
// // ),
