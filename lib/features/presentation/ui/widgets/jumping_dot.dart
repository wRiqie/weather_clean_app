import 'package:flutter/material.dart';

class JumpingDot extends AnimatedWidget {
  const JumpingDot({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    return Transform.translate(
      offset: Offset(0, animation.value),
      child: const Text(
        '.',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
