import 'package:flutter/material.dart';

import 'my_text.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Column(
            children: [
              MyText(title: "Good day for shopping", size: 18, color: Colors.grey),
              MyText(title: "Taimoor Sikander", size: 23, color: Colors.white)
            ],
          ),

        ],
      );
  }
}
