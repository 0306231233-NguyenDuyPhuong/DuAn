import 'package:flutter/material.dart';
import '../../../shared/widget/my_text.dart';


class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            title: "Popoular Products",
            size: 23,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          MyText(title: "View all", size: 14, fontWeight: FontWeight.bold,color: Colors.grey),
        ],
      ),
    );
  }
}
