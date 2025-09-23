import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutterpractices/Features/CarTracker/LocationPage.dart';
import 'package:flutterpractices/Features/CarTracker/SharedPref.dart';
import 'package:flutterpractices/Features/CarTracker/VehicleFormScreen.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Screens/SplashScreen.dart';
import 'package:flutterpractices/Features/ChoosePlan/ChoosePlanScreen.dart';
import 'package:flutterpractices/Features/MethodChanneling/controller.dart';
import 'package:flutterpractices/Features/MethodChanneling/screen.dart';
import 'package:flutterpractices/Features/ParagraphWithHttp/Api/ApiServices.dart';
import 'package:flutterpractices/Features/ParagraphWithHttp/Model/ExcerciseResponse.dart';
import 'package:flutterpractices/Features/SetState/SetStateScreen.dart';
import 'package:flutterpractices/Features/Shimmer_effect/ShimmerScreen.dart';
import 'package:flutterpractices/Features/StripePaymentMethod/paymentController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import 'Features/ParagraphWithHttp/ExcersiceDetailsScreen.dart';
import 'Features/ToDoReminder/ToDoScreen.dart';

class FeaturesScreen extends StatefulWidget {
  const FeaturesScreen({super.key});

  @override
  State<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main_background.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFeatureCard(
                  context,
                  icon: Icons.refresh,
                  title: "Set State",
                  onTap: () => _navigateTo(const SetStateScreen()),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  icon: Icons.api,
                  title: "Api testing",
                  onTap: () => _navigateTo(const Splashscreen()),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  icon: Icons.assignment,
                  title: "Choose Plan",
                  onTap: () => _navigateTo(const ChoosePlanScreen()),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  icon: Icons.animation,
                  title: "Shimmer Screen",
                  onTap: () => _navigateTo(const ShimmerScreen()),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  icon: Icons.directions_car,
                  title: "CarTracker with Firebase",
                  onTap: () => initializeAndNavigate(context),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  icon: Icons.notes,
                  title: "toDoReminder",
                  onTap: () => _navigateTo(
                    const ToDoScreen(),
                  ),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  icon: Icons.note,
                  title: "Paragraphs with Api",
                  onTap: () async {
                    _navigateTo(
                      const ExerciseDetailsScreen(),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  icon: Icons.note,
                  title: "Stripe Payment Method",
                  onTap: () async {
                    final PaymentController con = Get.put(PaymentController());
                    if (con.isClicked.value == false) {
                      await con.makePayment();
                      print("isClicked");
                    }
                  },
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  icon: Icons.note,
                  title: "Method Channeling",
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                          create: (_) => BatteryProvider()..fetchBatteryLevel(),
                          child: const MethodChannelingScreen(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [const Color(0xffc3ece5), Colors.lightBlue.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.blue.shade800),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade900,
                ),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, color: Colors.blue.shade600, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<ExcerciseResponse> fetchExerciseData() async {
    try {
      final response = await ApiServices().getExcerciseDetail();
      if (response.statusCode == 200) {
        return ExcerciseResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load exercise: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  void _navigateTo(Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

Future<void> initializeAndNavigate(BuildContext context) async {
  try {
    final service = FlutterBackgroundService();

    // Start the background service
    service.startService();

    // Load driver info
    SharedPref sharedPref = SharedPref();
    Map<String, String> driverInfo = await sharedPref.getDriverInfo();
    String locationDocPath = driverInfo['locationDocPath'] ?? '';

    // Navigate to correct screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => locationDocPath.isNotEmpty
            ? LocationPage(
                documentRef: FirebaseFirestore.instance.doc(locationDocPath),
              )
            : const VehicleFormScreen(),
      ),
    );
  } catch (e) {
    if (kDebugMode) {
      print("Error initializing background service: $e");
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error"),
        content: Text("Failed to start background service: $e"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
