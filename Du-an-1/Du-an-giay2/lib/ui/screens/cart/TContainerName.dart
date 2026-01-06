import 'package:flutter/material.dart';

import '../../shared/widget/my_text.dart';


class TContainerName extends StatelessWidget {
  const TContainerName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: "Nike",
            size: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey.withOpacity(0.6),
          ),
          MyText(
            title: "Green Nike sports shoe\nColors Green size EU 34",
            size: 17,
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
