import 'package:coffee_shop_test/ui/shared/widget/my_button.dart';
import 'package:coffee_shop_test/ui/shared/widget/my_text.dart';
import 'package:flutter/material.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 150, left:60, right: 20),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(200)
              ),
              child: Image.asset("assets/images/sammy-line-success.png"),
            ),
            const SizedBox(height: 20,),
            MyText(title: "Paymet Success!", size: 30, color: Colors.black87, fontWeight: FontWeight.bold,),
            const SizedBox(height: 20,),
            MyButton(radius: 12, width: 300, height: 60, colorButton: Colors.blueAccent, handler: (){
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              setState(() {
              });
            }, child: MyText(title: "Continue Shopping", size: 20, color: Colors.white))
          ],
        ),
      )
    );
  }
}
