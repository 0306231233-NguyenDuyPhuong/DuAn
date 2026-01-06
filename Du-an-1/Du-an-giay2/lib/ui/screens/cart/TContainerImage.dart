import 'package:flutter/material.dart';

import '../../shared/widget/my_image.dart';


class TContainerImage extends StatelessWidget {
  const TContainerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: MyImage(
            width: 70,
            height: 70,
            url: "assets/images/0_1.png",
          ),
        ),
      ),
    );
  }
}
