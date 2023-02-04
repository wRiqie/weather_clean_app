import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextForecastListTile extends StatelessWidget {
  final String day;
  final String image;
  final int min;
  final int max;
  const NextForecastListTile({
    super.key,
    required this.day,
    required this.image,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          image,
          width: 50,
        ),
        Row(
          children: [
            Text(
              '$max°C',
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '$min°C',
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: const Color.fromARGB(118, 255, 255, 255),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
