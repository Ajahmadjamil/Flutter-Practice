import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Html(
        data: """
        <div style=\"font-family: Arial, sans-serif; color: #000;\">\n  <div style=\"display: flex; align-items: flex-start; margin-bottom: 1rem;\">\n    <div style=\"background-color: black; color: white; border-radius: 50%; width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; font-weight: bold; margin-right: 12px;\">1</div>\n    <div>\n      <strong>The Uncovering Phase.</strong> During the first phase of forgiveness, you will improve your understanding of the injustice, and how it has impacted your life.\n    </div>\n  </div>\n\n  <div style=\"display: flex; align-items: flex-start; margin-bottom: 1rem;\">\n    <div style=\"background-color: black; color: white; border-radius: 50%; width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; font-weight: bold; margin-right: 12px;\">2</div>\n    <div>\n      <strong>The Decision Phase.</strong> During the second phase, you will gain a deeper understanding of what forgiveness is, and make the decision to choose or reject forgiveness as an option.\n    </div>\n  </div>\n\n  <div style=\"display: flex; align-items: flex-start; margin-bottom: 1rem;\">\n    <div style=\"background-color: black; color: white; border-radius: 50%; width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; font-weight: bold; margin-right: 12px;\">3</div>\n    <div>\n      <strong>The Work Phase.</strong> During the third phase, you will start to understand the offender in a new way, which will allow positive feelings toward the offender and yourself.\n    </div>\n  </div>\n\n  <div style=\"display: flex; align-items: flex-start;\">\n    <div style=\"background-color: black; color: white; border-radius: 50%; width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; font-weight: bold; margin-right: 12px;\">4</div>\n    <div>\n      <strong>The Deepening Phase.</strong> During the final phase of forgiveness, you will further decrease the negative emotions associated with the injustice. You may find meaning in the experiences, and recognize ways in which you have grown as a result.\n    </div>\n  </div>\n</div>
        """,
        extensions: [
          TagExtension(
            tagsToExtend: {"flutter"},
            child: const FlutterLogo(),
          ),
        ],
        style: {
          "p.fancy": Style(
            textAlign: TextAlign.center,
            // padding: const EdgeInsets.all(16),
            backgroundColor: Colors.grey,
            margin: Margins(left: Margin(50, Unit.px), right: Margin.auto()),
            width: Width(300, Unit.px),
            fontWeight: FontWeight.bold,
          ),
        },
      ),
    );
  }
}
