import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.radius,
    required this.width,
    required this.height,
    required this.colorButton,
    required this.handler, required this.child,
  });
  final double radius;
  final double width;
  final double height;
  final Color colorButton;
  final Widget child;

  final Function() handler;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: handler,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          minimumSize: Size(width, height),
          backgroundColor: colorButton,
        ),
        child: child,
      ),
    );
  }
}
