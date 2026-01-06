import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../shared/widget/my_text.dart';

class HomeAppbar extends StatelessWidget {
  final userData;
  const HomeAppbar({
    super.key, this.hanlder, required this.userData,
  });

  final Function()?hanlder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(title: "Good day for shopping", size: 16, color: Colors.grey),
              MyText(title: "Hi ${userData["name"]}", size: 22,fontWeight: FontWeight.bold, color: Colors.white)
            ],
          ),
          IconButton(onPressed: hanlder, icon: Icon(Iconsax.shopping_bag,size: 30, color: Colors.white,))
        ],
      ),
    );
  }
}
