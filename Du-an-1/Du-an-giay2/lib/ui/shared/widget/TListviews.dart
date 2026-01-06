import 'package:flutter/material.dart';

import 'my_image.dart';

class TListCategory extends StatelessWidget {
  const TListCategory({
    super.key,
    required this.axis,
    required this.list,
    this.boxShape,
    this.radius,
    required this.widthImage,
    required this.heightImage,
  });

  final Axis axis;
  final List<String> list;
  final BoxShape? boxShape;
  final double? radius;
  final double widthImage;
  final double heightImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: SizedBox(
        height: 90,
        child: ListView.builder(
          scrollDirection: axis,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: boxShape ?? BoxShape.rectangle,
                      borderRadius: boxShape == BoxShape.circle
                          ? null
                          : BorderRadius.circular(radius ?? 0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyImage(
                        width: widthImage,
                        height: heightImage,
                        url: "assets/images/${list[index]}",
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    list[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
