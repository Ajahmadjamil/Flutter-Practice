import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterpractices/Features/ParagraphWithHttp/AnimatedText.dart';
import 'package:flutterpractices/Features/ParagraphWithHttp/FontMangement/TextStyle.dart';

import 'Model/ExcerciseResponse.dart';

class ExerciseContent extends StatefulWidget {
  final List<ExerciseIntro> animatedIntros;

  const ExerciseContent({super.key, required this.animatedIntros});

  @override
  State<ExerciseContent> createState() => _ExerciseContentState();
}

class _ExerciseContentState extends State<ExerciseContent> {
  int _currentIndex = 0;
  bool _showingTitle = true;

  void _onTitleComplete() {
    setState(() {
      _showingTitle = false;
    });
  }

  void _onDescriptionComplete() {
    setState(() {
      if (_currentIndex < widget.animatedIntros.length - 1) {
        _currentIndex++;
        _showingTitle = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (int i = 0; i <= _currentIndex; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (i < _currentIndex)
                Text(
                  widget.animatedIntros[i].title ?? '',
                  style: getBoldStyle(fontSize: 18,color: Colors.black),
                )
              else
                _showingTitle
                    ? AnimatedText(
                        text: widget.animatedIntros[i].title ?? '',
                        isTitle: true,
                        onComplete: _onTitleComplete,
                      )
                    : Text(
                        widget.animatedIntros[i].title ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              const SizedBox(height: 8),
              if (i < _currentIndex)
                _buildContent(widget.animatedIntros[i])
              else if (!_showingTitle)
                AnimatedText(
                  text: widget.animatedIntros[i].description ?? '',
                  isTitle: false,
                  onComplete: _onDescriptionComplete,
                ),
              if (i < widget.animatedIntros.length - 1)
                const SizedBox(height: 24),
            ],
          ),
      ],
    );
  }

  Widget _buildContent(ExerciseIntro intro) {
    if (intro.type == "image" && intro.imageUrl != null) {
      return Image.network(
        intro.imageUrl!,
        loadingBuilder: (context, child, progress) {
          return progress == null
              ? child
              : const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stack) =>
            const Text('Failed to load image'),
      );
    } else if (intro.type == "html") {
      return Html(
        data: """${intro.description}""",
        extensions: [
          TagExtension(
            tagsToExtend: {"flutter"},
            child: const FlutterLogo(),
          ),
        ],
        style: {
          "p.fancy": Style(
            textAlign: TextAlign.center,
            backgroundColor: Colors.grey,
            margin: Margins(left: Margin(50, Unit.px), right: Margin.auto()),
            width: Width(300, Unit.px),
            fontWeight: FontWeight.bold,
          ),
        },
      );
    } else {
      return Text(
        intro.description ?? '',
        style:  getRegularStyle(color: Colors.black),
      );
    }
  }
}
