import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    required this.labelTitle,
    this.iconLeft,
    this.iconRight,
    required this.fontWeight,
    required this.size,
    required this.color,
    required this.colorSize,
    this.fillColor, this.onTap, this.controller, required this.stype

  });
  final double width;
  final double height;
  final double radius;
  final String labelTitle;
  final IconData? iconLeft;
  final IconData? iconRight;

  final FontWeight fontWeight;
  final double size;
  final Color color;
  final Color colorSize;
  final Color? fillColor;
  final TextEditingController? controller;
  final bool stype;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
          obscureText:stype,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: width, vertical: height),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            filled: true,
            fillColor: fillColor,
            hintText: labelTitle,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            labelStyle: TextStyle(
              fontWeight: fontWeight,
              fontSize: size,
              color: color,
            ),
            prefixIcon: Icon(iconLeft, weight: 900,),
            suffixIcon: Icon(iconRight),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: colorSize, width: 1)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Colors.grey,width: 1)
            )
          ),
        onTap: onTap,
        controller: controller,
        ),
    );
  }
}
