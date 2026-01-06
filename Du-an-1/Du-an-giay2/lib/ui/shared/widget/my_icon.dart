import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  const MyIcon({
    super.key,
    required this.widthContainer,
    required this.heightContainer,
    required this.radius,
    required this.child,

  });
  final double widthContainer;
  final double heightContainer;
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: widthContainer,
        height: heightContainer,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: child,
      ),
    );
  }
}
