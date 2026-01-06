import 'package:flutter/material.dart';
class TCirlerContainer extends StatelessWidget {
  const TCirlerContainer({
    super.key, required this.height, required this.width,
  });

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color:Color(0xFF3C68FF),
      child:Stack(
        children: [
          Positioned(
            top: -150,
            right: -220,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(400),
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
            top: 150,
            right: -250,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(400),
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          )
        ],
      ),
    );
  }
}