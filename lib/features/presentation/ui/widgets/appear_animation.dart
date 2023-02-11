import 'package:flutter/material.dart';

class AppearAnimation extends StatefulWidget {
  final Widget child;
  final AnimationController animation;
  const AppearAnimation({super.key, required this.child, required this.animation});

  @override
  State<AppearAnimation> createState() => _AppearAnimationState();
}

class _AppearAnimationState extends State<AppearAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> fadeInAnimation;
  late Animation<double> translateAnimation;

  @override
  void initState() {
    super.initState();

    fadeInAnimation =
        Tween<double>(begin: 0, end: 1).animate(widget.animation);
    translateAnimation =
        Tween<double>(begin: 30, end: 0).animate(widget.animation);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, translateAnimation.value),
          child: Opacity(
            opacity: fadeInAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
