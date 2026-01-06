import 'package:flutter/material.dart';

import 'app_colors.dart';
class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 55,
          width: 55,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(400),
              color: AppColor.kBorder.withOpacity(0.4)
          ),
          child: Center(child: Text("LOGO")),
        ),
        Text("CONTROL LED",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.black87),),
        Container(
          height: 55,
          width: 55,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(400),
              color: AppColor.kBorder.withOpacity(0.4)
          ),
          child: Center(child: Icon(Icons.more_horiz, size: 30,)),
        ),

      ],
    );
  }
}
