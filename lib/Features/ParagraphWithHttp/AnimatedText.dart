
import 'dart:async';

import 'package:flutter/material.dart';

import 'FontMangement/TextStyle.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final bool isTitle;
  final VoidCallback onComplete;

  const AnimatedText({
    super.key,
    required this.text,
    required this.isTitle,
    required this.onComplete,
  });

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  int _charIndex = 0;
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _typingTimer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
      if (_charIndex < widget.text.length) {
        setState(() => _charIndex++);
      } else {
        timer.cancel();
        widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.substring(0, _charIndex),
      style: widget.isTitle?getBoldStyle(color: Colors.black):getRegularStyle(color: Colors.black),
    );
  }
}