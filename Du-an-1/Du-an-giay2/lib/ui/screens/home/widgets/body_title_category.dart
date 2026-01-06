import 'package:flutter/material.dart';

import '../../../shared/widget/my_text.dart';


class BodyTitleCategory extends StatelessWidget {
  const BodyTitleCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MyText(
            title: "Popular Categories",
            size: 21,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}