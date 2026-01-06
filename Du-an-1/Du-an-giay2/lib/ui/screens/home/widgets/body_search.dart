import 'package:flutter/material.dart';

import 'search_container.dart';


class BodySearch extends StatelessWidget {
  const BodySearch({
    super.key, this.color, required this.controller, this.handler
  });
  final Color? color;
  final TextEditingController controller;
  final Function()?handler;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 65,
        padding: EdgeInsets.only(left: 16, right: 16),
        margin: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: color ?? Colors.transparent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.search),
            const SizedBox(width: 10,),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search in Store",
                  border: InputBorder.none
                ),
                controller: controller,
              ),
            )
          ],
        ),
      ),
      onTap: handler,
    );
  }
}