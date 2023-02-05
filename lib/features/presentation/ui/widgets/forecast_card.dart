import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastCard extends StatelessWidget {
  final int hour;
  final String image;
  final int temp;
  final bool isSelected;
  const ForecastCard({
    super.key,
    this.isSelected = false,
    required this.hour,
    required this.image,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: isSelected
          ? BoxDecoration(
              color: const Color.fromARGB(65, 37, 102, 163),
              border: Border.all(
                color: const Color(0xFF2566A3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                20,
              ),
            )
          : null,
      child: Column(
        children: [
          Text(
            '$temp°C',
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            image,
            width: 36,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '$hour.00',
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
