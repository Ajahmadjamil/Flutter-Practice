import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart'; // import your provider file

class MethodChannelingScreen extends StatelessWidget {
  const MethodChannelingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final batteryProvider = context.watch<BatteryProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Method Channeling"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              batteryProvider.batteryLevel,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                batteryProvider.fetchBatteryLevel();
              },
              child: const Text("Get Battery Level"),
            ),
          ],
        ),
      ),
    );
  }
}
