import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/ParagraphWithHttp/Api/ApiServices.dart';
import 'package:flutterpractices/Features/ParagraphWithHttp/ExcerciseContent.dart';
import 'package:flutterpractices/Features/ParagraphWithHttp/Model/ExcerciseResponse.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  const ExerciseDetailsScreen({super.key});

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  late Future<ExcerciseResponse> futureExercise;
  final List<ExerciseIntro> _animatedIntros = [];
  bool _allAnimationsComplete = false;

  @override
  void initState() {
    super.initState();
    futureExercise = fetchExerciseData();
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

  void _startAnimations(List<ExerciseIntro> intros) {
    _animatedIntros.clear();
    _allAnimationsComplete = false;

    for (int i = 0; i < intros.length; i++) {
      Timer(Duration(milliseconds: i * 800), () {
        if (!mounted) return;
        setState(() {
          _animatedIntros.add(intros[i]);
          if (i == intros.length - 1) {
            _allAnimationsComplete = true;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Behavioural Chain Analysis',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),

                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<ExcerciseResponse>(
                  future: futureExercise,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else
                    if (!snapshot.hasData || snapshot.data!.data == null) {
                      return const Center(child: Text(
                          'No exercise data available'));
                    } else {
                      if (_animatedIntros.isEmpty && !_allAnimationsComplete) {
                        _startAnimations(snapshot.data!.data!.exerciseIntros!);
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ExerciseContent(animatedIntros: _animatedIntros);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
