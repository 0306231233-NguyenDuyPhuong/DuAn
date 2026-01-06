import 'package:flutter/material.dart';

class AddAddressContainer extends StatelessWidget {
  const AddAddressContainer({
    super.key,
    required this.width,
    required this.icon,
    required this.title,
    required this.controller,
    this.handler,
    this.onSubmit,
  });
  final double width;
  final Icon icon;
  final String title;
  final TextEditingController controller;
  final Function(dynamic)? handler;
  final Function(String value)? onSubmit;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hint: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              controller: controller,
              onChanged: handler,
              onSubmitted: onSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
