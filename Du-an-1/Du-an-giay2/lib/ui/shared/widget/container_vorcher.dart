import 'package:flutter/material.dart';
class TContainerVorcher extends StatelessWidget {
  const TContainerVorcher({
    super.key,
    required this.height,
    required this.width,
    required this.colorContainer,
    required this.radiuseContainer,
    required this.child,
  });

  final double height;
  final double width;
  final Color colorContainer;
  final double radiuseContainer;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiuseContainer),
        color: colorContainer,
      ),
      child: child,
    );
  }
}
