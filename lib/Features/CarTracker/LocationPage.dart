import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationPage extends StatelessWidget {
  final DocumentReference documentRef;
  const LocationPage({super.key, required this.documentRef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: documentRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.data() as Map<String, dynamic>?;

          if (data == null) {
            return const Center(
              child: Text("No location data yet",
                  style: TextStyle(color: Colors.white)),
            );
          }

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Battery: ${data['battery']}%",
                        style:
                        const TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 16),
                    Text("Latitude: ${data['latitude']}",
                        style:
                        const TextStyle(color: Colors.white, fontSize: 16)),
                    Text("Longitude: ${data['longitude']}",
                        style:
                        const TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
