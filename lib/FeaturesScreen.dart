import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/CherryBerryPos/Screens/SplashScreen.dart';
import 'package:flutterpractices/Features/ChoosePlan/ChoosePlanScreen.dart';
import 'package:flutterpractices/Features/Shimmer_effect/ShimmerScreen.dart';

class FeaturesScreen extends StatefulWidget {
  const FeaturesScreen({super.key});

  @override
  State<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Features"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Splashscreen()),
              );
              }, child: const Text("Api testing")),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ChoosePlanScreen()),
              );
            }, child: const Text("Choose Plan")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ShimmerScreen()),
              );
            }, child: const Text("Shimmmer Screen")),

          ],
        ),
      ),
    );
  }
}
