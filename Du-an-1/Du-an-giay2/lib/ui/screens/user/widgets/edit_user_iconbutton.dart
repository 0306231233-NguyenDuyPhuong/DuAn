import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditUserIconbutton extends StatelessWidget {
  final txtController;
  final Function() hander;
  final String title;
  EditUserIconbutton({super.key, required this.hander, required this.txtController, required this.title});

  @override
  Widget build(BuildContext context) {

    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                controller: txtController,
              ),
              actions: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Exit"),
                    ),
                    ElevatedButton(
                      onPressed: hander,
                      child: Text("Edit"),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
      icon: Icon(
        Iconsax.arrow_right_3,
        size: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
