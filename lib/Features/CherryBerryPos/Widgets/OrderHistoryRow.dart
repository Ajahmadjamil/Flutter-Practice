import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Model/GetOrdersResponse.dart';

class OrderHistoryRow extends StatelessWidget {
  final List<Data> listsData;

  const OrderHistoryRow({super.key, required this.listsData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: listsData.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 16
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Container(
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              listsData[index].dailyorderId.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff302D3D)),
                            ),
                            SizedBox(width: 4),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff969DB6)),
                            ),
                            SizedBox(width: 4),
                            Text(
                              listsData[index].orderDate.toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff969DB6)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff9900FF)),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "POS",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9900FF)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashColor: Colors.grey,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                listsData[index].orderTypeId.toString() == "1"?
                    Container()
                    :
                Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: OrderTypeContainer(
                                "assets/icons/ic_takeaway.svg", "Take Away")),
                        const Row(
                          children: [
                            SizedBox(width: 4),
                            Text(
                              "Unpaid",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Rs 400",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                      Text(
                      "Unpaid",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    ),
                            Row(
                              children: [
                                Text(
                                  "Rs 400",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: OrderTypeContainer(
                                    "assets/icons/ic_dinein.svg", "Dine In")),
                            const Row(
                              children: [
                                SizedBox(width: 4),
                                Text(
                                  "Unpaid",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Rs 400",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Unpaid",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rs 400",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: OrderTypeContainer(
                                    "assets/icons/ic_delivery.svg", "Delivery")),
                            const Row(
                              children: [
                                SizedBox(width: 4),
                                Text(
                                  "Unpaid",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight .w500,
                                      color: Colors.red),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Rs 400",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xff604BE8).withOpacity(0.20),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(child: OrderStatusContainer("Recieved")),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/ic_card.svg",
                                height: 36, width: 36),
                            const SizedBox(width: 8),
                            SvgPicture.asset("assets/icons/ic_invoice.svg",
                                height: 36, width: 36),
                            const SizedBox(width: 8),
                            SvgPicture.asset("assets/icons/ic_edit.svg",
                                height: 36, width: 36),
                            const SizedBox(width: 8),
                            SvgPicture.asset("assets/icons/ic_edit_order.svg",
                                height: 36, width: 36)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget OrderTypeContainer(String iconPath, String text) {
  return Container(
    height: 36,
    decoration: BoxDecoration(
        border: Border.all(color: Color(0xffDCDCDC), width: 1),
        borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 10, 8),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 20,
            width: 20,
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 4),
          SvgPicture.asset("assets/icons/ic_down.svg", height: 20, width: 20)
        ],
      ),
    ),
  );
}

Widget OrderStatusContainer(String text) {
  return Container(
    height: 36,
    decoration:
    BoxDecoration(
        border: Border.all(color: Color(0xffDCDCDC), width: 1),
 color: Colors.white,
        borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 10, 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Color(0xffFF9F04)),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 4),
          SvgPicture.asset("assets/icons/ic_down.svg", height: 20, width: 20)
        ],
      ),
    ),
  );
}
