// import 'dart:async';
// import 'dart:convert';
//
// import 'package:bluetooth_print/bluetooth_print.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
//
//   bool _connected = false;
//   BluetoothDevice? _device;
//   String tips = 'no device connect';
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => initBluetooth());
//   }
//
//   // Initialize Bluetooth
//   Future<void> initBluetooth() async {
//     try {
//       await bluetoothPrint.startScan(timeout: Duration(seconds: 4));
//       bool isConnected = await bluetoothPrint.isConnected ?? false;
//
//       bluetoothPrint.state.listen((state) {
//         print('******************* Current device status: $state');
//
//         switch (state) {
//           case BluetoothPrint.CONNECTED:
//             setState(() {
//               _connected = true;
//               tips = 'connect success';
//             });
//             break;
//           case BluetoothPrint.DISCONNECTED:
//             setState(() {
//               _connected = false;
//               tips = 'disconnect success';
//             });
//             break;
//           default:
//             break;
//         }
//       });
//
//       if (isConnected) {
//         setState(() {
//           _connected = true;
//         });
//       }
//     } catch (e) {
//       print('Error initializing Bluetooth: $e');
//       setState(() {
//         tips = 'Bluetooth initialization failed';
//       });
//     }
//   }
//
//   // Print Custom Receipt
//   Future<void> printCustomReceipt() async {
//     if (!_connected || _device == null) {
//       print('Printer not connected');
//       setState(() {
//         tips = 'Printer not connected';
//       });
//       return;
//     }
//
//     try {
//       // Printer configuration
//       Map<String, dynamic> config = {
//         'width': 80, // Width of the receipt in mm
//         'height': 150, // Height of the receipt in mm
//         'gap': 2, // Gap between receipts in mm
//       };
//
//       List<LineText> list = [];
//
//       // Header Section
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: '==============================',
//           weight: 1,
//           align: LineText.ALIGN_CENTER,
//           linefeed: 1));
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: '  My Custom Store  ',
//           weight: 2, // Bold
//           align: LineText.ALIGN_CENTER,
//           fontZoom: 2, // Increase font size
//           linefeed: 1));
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: '123 Main Street, City Name',
//           align: LineText.ALIGN_CENTER,
//           linefeed: 1));
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: 'Phone: +1234567890',
//           align: LineText.ALIGN_CENTER,
//           linefeed: 2)); // Extra spacing
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: '==============================',
//           weight: 1,
//           align: LineText.ALIGN_CENTER,
//           linefeed: 1));
//
//       // Order Details Section
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: 'Item         Qty     Price',
//           weight: 1,
//           align: LineText.ALIGN_LEFT,
//           linefeed: 1));
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: '--------------------------------',
//           align: LineText.ALIGN_CENTER,
//           linefeed: 1));
//
//       // Sample Items
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: 'Burger       x2     \$10.00',
//           align: LineText.ALIGN_LEFT,
//           linefeed: 1));
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: 'Pizza        x1     \$15.00',
//           align: LineText.ALIGN_LEFT,
//           linefeed: 1));
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: 'Coke         x3     \$6.00',
//           align: LineText.ALIGN_LEFT,
//           linefeed: 2));
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: '--------------------------------',
//           align: LineText.ALIGN_CENTER,
//           linefeed: 1));
//
//       // Total Amount
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: 'Total:              \$31.00',
//           weight: 2,
//           align: LineText.ALIGN_RIGHT,
//           fontZoom: 2,
//           linefeed: 2));
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: 'Thank You! Visit Again.',
//           weight: 1,
//           align: LineText.ALIGN_CENTER,
//           linefeed: 2));
//
//       list.add(LineText(
//           type: LineText.TYPE_TEXT,
//           content: '==============================',
//           weight: 1,
//           align: LineText.ALIGN_CENTER,
//           linefeed: 2));
//
//       // Print the receipt
//       print('Sending data to printer...');
//       await bluetoothPrint.printReceipt(config, list);
//       print('Printing completed');
//       setState(() {
//         tips = 'Printing completed';
//       });
//     } catch (e) {
//       print('Error printing receipt: $e');
//       setState(() {
//         tips = 'Printing failed: $e';
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('BluetoothPrint example app'),
//         ),
//         body: RefreshIndicator(
//           onRefresh: () => bluetoothPrint.startScan(timeout: Duration(seconds: 4)),
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                         child: Text(tips)),
//                   ],
//                 ),
//                 Divider(),
//                 StreamBuilder<List<BluetoothDevice>>(
//                   stream: bluetoothPrint.scanResults,
//                   initialData: [],
//                   builder: (c, snapshot) => Column(
//                     children: snapshot.data!.map((d) => ListTile(
//                       title: Text(d.name ?? ''),
//                       subtitle: Text(d.address ?? ''),
//                       onTap: () async {
//                         setState(() {
//                           _device = d;
//                         });
//                       },
//                       trailing: _device != null && _device!.address == d.address
//                           ? Icon(
//                         Icons.check,
//                         color: Colors.green,
//                       )
//                           : null,
//                     )).toList(),
//                   ),
//                 ),
//                 Divider(),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
//                   child: Column(
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           OutlinedButton(
//                             child: Text('connect'),
//                             onPressed: _connected ? null : () async {
//                               if (_device != null && _device!.address != null) {
//                                 setState(() {
//                                   tips = 'connecting...';
//                                 });
//                                 await bluetoothPrint.connect(_device!);
//                               } else {
//                                 setState(() {
//                                   tips = 'please select device';
//                                 });
//                                 print('please select device');
//                               }
//                             },
//                           ),
//                           SizedBox(width: 10.0),
//                           OutlinedButton(
//                             child: Text('disconnect'),
//                             onPressed: _connected ? () async {
//                               setState(() {
//                                 tips = 'disconnecting...';
//                               });
//                               await bluetoothPrint.disconnect();
//                             } : null,
//                           ),
//                         ],
//                       ),
//                       Divider(),
//                       OutlinedButton(
//                         child: Text('Print Receipt (Custom)'),
//                         onPressed: _connected ? printCustomReceipt : null,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: StreamBuilder<bool>(
//           stream: bluetoothPrint.isScanning,
//           initialData: false,
//           builder: (c, snapshot) {
//             if (snapshot.data == true) {
//               return FloatingActionButton(
//                 child: Icon(Icons.stop),
//                 onPressed: () => bluetoothPrint.stopScan(),
//                 backgroundColor: Colors.red,
//               );
//             } else {
//               return FloatingActionButton(
//                   child: Icon(Icons.search),
//                   onPressed: () => bluetoothPrint.startScan(timeout: Duration(seconds: 4)));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }