import 'package:flutter/material.dart';

import 'jumping_dot.dart';

class JumpingDotsProgressIndicator extends StatefulWidget {
  final int numberOfDots;
  final double beginTweenValue = 0.0;
  final double endTweenValue = 8.0;
  const JumpingDotsProgressIndicator({
    super.key,
    required this.numberOfDots,
  });

  @override
  State<JumpingDotsProgressIndicator> createState() =>
      _JumpingDotsProgressIndicatorState();
}

class _JumpingDotsProgressIndicatorState
    extends State<JumpingDotsProgressIndicator> with TickerProviderStateMixin {
  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numberOfDots; i++) {
      // adding controllers
      controllers.add(AnimationController(
          duration: const Duration(milliseconds: 300), vsync: this));

      // adding animation values
      animations.add(
          Tween(begin: widget.beginTweenValue, end: widget.endTweenValue)
              .animate(controllers[i])
            ..addStatusListener((AnimationStatus status) {
              if (status == AnimationStatus.completed) {
                controllers[i].reverse();
              }
              if (i == widget.numberOfDots - 1 &&
                  status == AnimationStatus.dismissed) {
                controllers[0].forward();
              }
              if (animations[i].value > widget.endTweenValue / 2 &&
                  i < widget.numberOfDots - 1) {
                controllers[i + 1].forward();
              }
            }));

      // adding list of widgets
      widgets.add(Padding(
        padding: const EdgeInsets.only(right: 1.0),
        child: JumpingDot(
          animation: animations[i],
        ),
      ));
    }

    // animating first dot in the list
    controllers[0].forward();
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.numberOfDots; i++) {
      controllers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }
}
