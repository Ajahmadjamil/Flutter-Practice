import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrintPage extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  PrintPage(this.data, {Key? key}) : super(key: key);

  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String _devicesMsg = "";
  final f = NumberFormat("\$####,###.00", "en_US");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initPrinter();
    });
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));

    bluetoothPrint.scanResults.listen((val) {
      if (!mounted) return;
      setState(() {
        _devices = val;
      });
      if (_devices.isEmpty) {
        setState(() {
          _devicesMsg = "No Devices";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Print Invoice"),
      ),
      body: _devices.isEmpty
          ? Center(
        child: Text(_devicesMsg ?? "No devices found"),
      )
          : ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (c, i) {
          return ListTile(
            leading: Icon(Icons.print),
            title: Text(_devices[i].name.toString()),
            subtitle: Text(_devices[i].address.toString()),
            onTap: () {
              _startPrint(_devices[i]);
            },
          );
        },
      ),
    );
  }

  Future<void> _startPrint(BluetoothDevice device) async {
    // Connect to the device
    await bluetoothPrint.connect(device);

    // Prepare the print configuration
    Map<String, dynamic> config = {};

    // Prepare the list of LineText for printing
    List<LineText> list = [];

    // Add a header
    list.add(
      LineText(
        type: LineText.TYPE_TEXT,
        content: "CherryBerryPos",
        weight: 2,
        width: 2,
        height: 2,
        align: LineText.ALIGN_CENTER,
        linefeed: 1,
      ),
    );

    // Add invoice items
    for (var i = 0; i < widget.data.length; i++) {
      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: widget.data[i]['item'],
          weight: 1,
          align: LineText.ALIGN_LEFT,
          linefeed: 1,
        ),
      );

      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content:
          "${f.format(widget.data[i]["price"])} x ${widget.data[i]["quantity"]}",
          align: LineText.ALIGN_LEFT,
          linefeed: 1,
        ),
      );
    }
    print("Connecting to device: ${device.name}");
    print("Sending print data: ${list.length} items");
    print("config ${config}");
    print("list:: ${list}");
    // Send the data to the printer
    await bluetoothPrint.printLabel(config, list);
  }
}