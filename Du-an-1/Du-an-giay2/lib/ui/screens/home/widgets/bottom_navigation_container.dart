import 'package:flutter/material.dart';

import '../../../shared/widget/my_text.dart';

class BottomNavigationContainer extends StatelessWidget {
  const BottomNavigationContainer({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.icon,
    required this.title,
    this.handler,
  });
  final double height;
  final double width;
  final Color color;
  final Icon icon;
  final Function()? handler;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: handler, icon: icon,),
            MyText(
              title: title,
              size: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      onTap:handler,
    );
  }
}
