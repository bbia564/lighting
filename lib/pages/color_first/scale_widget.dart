import 'dart:async';

import 'package:flutter/material.dart';

class ScalableWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double minScale;
  final double maxScale;

  const ScalableWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.minScale = 0.8,
    this.maxScale = 1.2,
  }) : super(key: key);

  @override
  _ScalableWidgetState createState() => _ScalableWidgetState();
}

class _ScalableWidgetState extends State<ScalableWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: widget.minScale, end: widget.maxScale)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: widget.child,
        );
      },
    );
  }
}