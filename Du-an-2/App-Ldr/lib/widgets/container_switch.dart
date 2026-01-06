import 'package:flutter/material.dart';

import 'app_colors.dart';

class ContainerSwitch extends StatelessWidget {
  const ContainerSwitch({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        width: 190,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
              color: AppColor.kPrimaryPurpleEnd.withOpacity(0.2),
              width: 2
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child);
  }
}
