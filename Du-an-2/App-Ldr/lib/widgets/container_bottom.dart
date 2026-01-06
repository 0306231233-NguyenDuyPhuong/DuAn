import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'app_colors.dart';

class ContainerBottom extends StatelessWidget {
  const ContainerBottom({
    super.key, required this.handler, required this.icon,
  });
  final Function() handler;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 50, right: 50),
      decoration: BoxDecoration(
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: handler
              , icon: icon),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(400),
                color: AppColor.kAccentBlue.withOpacity(0.4)
            ),
            child: Center(
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: AppColor.kLightLavender
                  ),
                  child: Icon(Icons.add, size: 50, color: AppColor.kPrimaryPurpleEnd,)),
            ),
          ),
          Icon(Icons.settings, size: 40, color: Colors.grey,),

        ],
      ),
    );
  }
}
