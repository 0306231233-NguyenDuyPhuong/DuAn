import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    super.key,
    required this.width,
    required this.height,
    required this.url,
  });
  final double width;
  final double height;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Image.network(width: width, height: height, url);
  }
}
