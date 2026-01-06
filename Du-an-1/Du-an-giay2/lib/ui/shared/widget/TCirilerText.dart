import 'package:flutter/material.dart';

class TCirclerText extends StatelessWidget {
  const TCirclerText({
    super.key,
    required this.width,
    required this.height,
    this.color, required this.child, required this.hanlder,

  });
  final double width;
  final double height;
  final Color? color;
  final Widget child;
  final Function() hanlder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          color: color,
        ),
        child: child
      ),
      onTap: hanlder,
    );
  }
}
