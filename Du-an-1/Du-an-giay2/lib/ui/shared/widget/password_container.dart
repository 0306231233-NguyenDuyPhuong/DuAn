import 'package:flutter/material.dart';

class PasswordContainer extends StatelessWidget {
  const PasswordContainer({
    super.key,
    required this.width,
    required this.icon,
    required this.title,
    required this.controller,
    required this.handler,
    required this.obscurren, required this.iconPass,
  });
  final double width;
  final Icon icon;
  final Icon iconPass;
  final String title;
  final TextEditingController controller;
  final Function() handler;
  final bool obscurren;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
              obscureText: obscurren,
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
                suffixIcon: IconButton(onPressed: handler, icon: iconPass)
              ),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
