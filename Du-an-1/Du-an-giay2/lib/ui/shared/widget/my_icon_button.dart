import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key, required this.handler, required this.icon});
  final Function() handler;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: handler, icon: icon);
  }
}
