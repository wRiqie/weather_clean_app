import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelIcon extends StatelessWidget {
  final String? label;
  final IconData? icon;

  const LabelIcon({
    super.key,
    this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          label ?? '',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
