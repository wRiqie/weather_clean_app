import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_clean_app/core/images.dart';
import 'package:weather_clean_app/features/presentation/ui/widgets/jumping_dot.dart';
import 'package:weather_clean_app/features/presentation/ui/widgets/jumping_dots_progress_indicator.dart';

class AnimatedLoader extends StatefulWidget {
  const AnimatedLoader({super.key});

  @override
  State<AnimatedLoader> createState() => _AnimatedLoaderState();
}

class _AnimatedLoaderState extends State<AnimatedLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> floatAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )
      ..forward()
      ..repeat(reverse: true);
    floatAnimation =
        Tween<double>(begin: 0, end: -5).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                0,
                floatAnimation.value,
              ),
              child: SvgPicture.asset(
                Images.loader,
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Carregando dados',
              style: GoogleFonts.roboto(
                  color: Colors.white, fontWeight: FontWeight.w300),
            ),
            const SizedBox(width: 5,),
            const JumpingDotsProgressIndicator(numberOfDots: 4)
          ],
        ),
        // JumpingDot(animation: floatAnimation)
      ],
    );
  }
}
