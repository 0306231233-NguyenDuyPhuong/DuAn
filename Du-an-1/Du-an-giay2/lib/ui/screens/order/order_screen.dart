import 'package:coffee_shop_test/data/viewmodels/order_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/order/delivered_screen.dart';
import 'package:coffee_shop_test/ui/screens/order/widget/order_list_screen.dart';
import 'package:coffee_shop_test/ui/shared/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:intl/intl.dart';

String formatDate(String dateString) {
  final date = DateTime.parse(dateString);
  return DateFormat('dd/MM/yyyy').format(date);
}

class OrderView extends StatefulWidget {
  final String token;
  final int user_id;
  const OrderView({super.key, required this.token, required this.user_id});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  late Future<Map<String, dynamic>> _fetchData;
  List<dynamic> allOrders = [];
  List<dynamic> filteredOrders = [];
  final listStatusOrder = [
    "Pending",
    "Processing",
    "Shipped",
    "Delivered",
    "Cancelled",
    "Refunded",
    "Failed",
  ];

  final listStatusColor = [
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.red,
    Colors.teal,
    Colors.grey,
  ];

  OrderViewModel orderViewModel = OrderViewModel();
  Future<Map<String, dynamic>> loadOrder() async {
    final result = await Future.wait([orderViewModel.getOrders(widget.token)]);
    return {'orders': result[0]};
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData = loadOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Orders",
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _fetchData,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              throw UnimplementedError();
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              // TODO: Handle this case.
              throw UnimplementedError();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              if (allOrders.isEmpty) {
                allOrders = snapshot.data!["orders"]['orders']['data'];
                filteredOrders = List.from(allOrders);
              }

              return Column(
                children: [
                  // Phần cố định
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listStatusOrder.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              filteredOrders = allOrders
                                  .where((item) => item["status"] == index+1)
                                  .toList();
                              print(filteredOrders);
                            });
                          },
                          child: Container(
                            height: 60,
                            margin: EdgeInsets.only(left: 8, right: 8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: listStatusColor[index],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: MyText(
                                title: listStatusOrder[index],
                                size: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //Phần cuộn
                  Expanded(
                      child:OrderListview(orders: filteredOrders, token: widget.token, user_id: widget.user_id,),
                  )

                ],
              );
          }
        },
      ),
    );
  }
}
