import 'package:app_ldr/widgets/container_switch.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'app_colors.dart';

class ContainerLed extends StatelessWidget {
  const ContainerLed({
    super.key,
    required this.color,
    this.height,
    this.width,
    required this.childSwitch1,
    required this.childSwitch2,
    required this.isCheck1,
    required this.isCheck2,
    required this.title,
    required this.ldr,
  });
  final String title;
  final int ldr;
  final Color color;
  final double? height;
  final double? width;
  final Widget childSwitch1;
  final Widget childSwitch2;
  final bool isCheck1;
  final bool isCheck2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: AppColor.kPrimaryPurpleEnd, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Iconsax.sun_1, size: 50, color: AppColor.kLedYellow),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            "LDR: ${ldr}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(
                    Iconsax.lamp_charge,
                    size: 40,
                    color: isCheck1 ? AppColor.kLedYellow : Colors.grey,
                  ),
                  Text(
                    "Tối",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              childSwitch1,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(
                    Iconsax.lamp_charge,
                    size: 40,
                    color: isCheck2 ? AppColor.kLedYellow : Colors.grey,
                  ),
                  Text(
                    "Sáng",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              childSwitch2,
            ],
          ),
        ],
      ),
    );
  }
}
