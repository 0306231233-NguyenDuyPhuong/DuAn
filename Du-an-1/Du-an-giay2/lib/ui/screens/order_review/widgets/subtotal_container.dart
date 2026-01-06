import 'package:flutter/material.dart';

import '../../../shared/widget/my_text.dart';


class SubtotalContainer extends StatelessWidget {
  final int subtatol;
  const SubtotalContainer({
    super.key, required this.subtatol,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: MyText(
                title: "Subtotal",
                size: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: MyText(
                title: "Shipping Fee",
                size: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: MyText(
                title: "Tax Fee",
                size: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: MyText(
                title: "Order Total",
                size: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: MyText(
                title: "\$${subtatol}",
                size: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: MyText(
                title: "\$0",
                size: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: MyText(
                title: "\$0",
                size: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MyText(
                title: "\$${subtatol}",
                size: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),
          ],
        ),
      ],
    );
  }
}
