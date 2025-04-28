// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:intl/intl.dart';
//
// class TestPrint {
//   BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
//
//   void sampleInvoice() async {
//     if ((await bluetooth.isConnected)!) {
//       // Print Store Header
//       bluetooth.printNewLine();
//       bluetooth.printCustom("MY STORE", 3, 1); // Bold, Large, Centered
//       bluetooth.printCustom("123 Main Street", 1, 1);
//       bluetooth.printCustom("City, State - 12345", 1, 1);
//       bluetooth.printCustom("Phone: +1 234 567 890", 1, 1);
//       bluetooth.printNewLine();
//
//       // Print Date and Time
//       String date = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
//       bluetooth.printLeftRight("Date:", date, 0);
//       bluetooth.printNewLine();
//
//       // Print Separator
//       bluetooth.printCustom("--------------------------------", 1, 1);
//
//       // Print Itemized List (Name, Qty, Price)
//       bluetooth.printLeftRight("Item", "Total", 1);
//       bluetooth.printLeftRight("Burger x2", "\$10.00", 1);
//       bluetooth.printLeftRight("Pasta x1", "\$8.00", 1);
//       bluetooth.printLeftRight("Coke x3", "\$6.00", 1);
//       bluetooth.printCustom("--------------------------------", 1, 1);
//
//       // Print Subtotal, Tax, and Total
//       bluetooth.printLeftRight("Subtotal", "\$24.00", 1);
//       bluetooth.printLeftRight("Tax (10%)", "\$2.40", 1);
//       bluetooth.printLeftRight("TOTAL", "\$26.40", 2); // Larger font
//
//       // Print Payment Status
//       bluetooth.printCustom("--------------------------------", 1, 1);
//       bluetooth.printCustom("Payment: PAID", 2, 1);
//       bluetooth.printCustom("--------------------------------", 1, 1);
//
//       // Print Barcode (Order Number)
//       bluetooth.printNewLine();
//       bluetooth.printCustom("Order #123456", 2, 1);
//       bluetooth.printQRcode("123456", 1, 50, 100);
//       bluetooth.printNewLine();
//
//       // Print Footer Message
//       bluetooth.printCustom("Thank You for Your Business!", 1, 1);
//       bluetooth.printCustom("Visit Again!", 1, 1);
//       bluetooth.printNewLine();
//
//       // Cut Paper
//       bluetooth.paperCut();
//     } else {
//       print("Printer not connected");
//     }
//   }
// }
