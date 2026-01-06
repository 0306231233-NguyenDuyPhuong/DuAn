import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../order_processing_screen.dart';
import '../delivered_screen.dart';
import '../order_screen.dart';

class OrderListview extends StatefulWidget {
  final orders;
  final String token;
  final int user_id;
  const OrderListview({super.key,required this.orders, required this.token, required this.user_id});

  @override
  State<OrderListview> createState() => _OrderListviewState();
}

class _OrderListviewState extends State<OrderListview> {
  final listStatusOrder = ["","Pending", "Processing","Shipped","Delivered","Cancelled","Refunded","Failed"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.orders.length,
        itemBuilder: (context, index){
          final item = widget.orders[index];

          return Container(
            height: 170,
            width: 300,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Iconsax.ship,size: 30, fontWeight: FontWeight.bold,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${listStatusOrder[item["status"]]}", style: const TextStyle(fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                            Text(formatDate(item["updated_at"]), style: const TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),
                    IconButton(onPressed: (){
                      switch(item["status"]){
                        case 2:{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderProcessingScreen( token:widget.token, orders: item, user_id: widget.user_id,)));
                          break;
                        }
                        case 4:{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailView(token: widget.token, user_id: widget.user_id, orders: item,)));
                          break;
                        }
                      }
                    },
                        icon: Icon(Iconsax.arrow_right_3, size: 20, fontWeight: FontWeight.bold,))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Iconsax.tag, color: Colors.black87, size: 30,fontWeight: FontWeight.bold,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order", style: const TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),),
                            Text("${item["id"]}", style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Iconsax.calendar, color: Colors.black87, size: 30,fontWeight: FontWeight.bold,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date", style: const TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),),
                            Text(formatDate(item["updated_at"]), style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
