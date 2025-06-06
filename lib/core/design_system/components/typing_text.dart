import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TypingText extends StatefulWidget {
  final String fullText;
  final Duration letterDelay;
  final TextStyle? style;
  final VoidCallback? onCompleted;

  const TypingText({
    super.key,
    required this.fullText,
    this.letterDelay = const Duration(milliseconds: 50),
    this.style,
    this.onCompleted,
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _charCount;

  @override
  void initState() {
    super.initState();

    final totalDuration = widget.letterDelay * widget.fullText.length;

    _controller = AnimationController(vsync: this, duration: totalDuration);

    _charCount = StepTween(
      begin: 0,
      end: widget.fullText.length,
    ).animate(_controller);

    _controller.addStatusListener(_statusListener);

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant TypingText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fullText != widget.fullText) {
      _controller.duration = widget.letterDelay * widget.fullText.length;
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_statusListener);
    _controller.dispose();
    super.dispose();
  }

  void _statusListener(status) {
    if (status == AnimationStatus.completed) {
      widget.onCompleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _charCount,
      builder: (context, child) {
        final count = _charCount.value;
        return MarkdownBody(
          data: widget.fullText.substring(0, count),
          styleSheet: MarkdownStyleSheet.fromTheme(
            Theme.of(context),
          ).copyWith(p: widget.style),
        );
      },
    );
  }
}
