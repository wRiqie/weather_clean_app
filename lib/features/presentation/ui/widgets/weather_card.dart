import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final Widget? subtitleWidget;
  final List<Widget> children;
  const WeatherCard({
    super.key,
    required this.title,
    required this.subtitleWidget,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    const cardColor = Color.fromARGB(77, 0, 16, 38);

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitleWidget ?? Container(),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          ...children,
        ],
      ),
    );
  }
}
