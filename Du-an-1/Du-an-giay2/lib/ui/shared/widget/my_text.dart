import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.title,
    required this.size,
    this.fontWeight,
    required this.color, this.maxlines,
  });
  final String title;
  final double size;
  final FontWeight? fontWeight;
  final Color color;
  final int? maxlines;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,

      ),
      maxLines: maxlines,
      softWrap: true,
      overflow: TextOverflow.ellipsis,

    );
  }
}
