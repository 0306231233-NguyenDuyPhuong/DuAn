import 'package:flutter/material.dart';

class AccountContainer extends StatelessWidget {
  const AccountContainer({
    super.key, required this.icon, required this.title1, required this.title2, required this.handler,
  });
  final Icon icon;
  final String title1;
  final String title2;
  final Function() handler;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handler,
      child: Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 20,height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title1, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Text(title2, style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      ),
    );
  }
}