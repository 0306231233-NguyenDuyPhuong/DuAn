import 'package:coffee_shop_test/data/viewmodels/order_detail_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/cart/widgets/list_cart_overview.dart';
import 'package:coffee_shop_test/ui/shared/widget/my_text.dart';
import 'package:flutter/material.dart';

import '../cart/cart_list.dart';

class OrderProcessingScreen extends StatefulWidget {
  final orders;
  final String token;
  final int user_id;
  const OrderProcessingScreen({super.key, required this.orders, required this.token, required this.user_id});

  @override
  State<OrderProcessingScreen> createState() => _OrderprocessingviewState();
}

class _OrderprocessingviewState extends State<OrderProcessingScreen> {
  late Future<Map<String, dynamic>> _fetchData;
  OrderDetailViewModel orderDetailViewModel = OrderDetailViewModel();
  List<dynamic> productVariantIdList = [];

  Future<Map<String, dynamic>> loadData()async{
    final orderData = await orderDetailViewModel.getOrderDetail(widget.token, widget.orders["id"]);
    return {
      "order_detail":orderData,
    };
  }

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData = loadData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(title: "Processing", size: 25, color: Colors.black87, fontWeight: FontWeight.bold,),
      ),
      body: FutureBuilder(
          future: _fetchData,
          builder: (context, snapshot){
            switch(snapshot.connectionState) {
              case ConnectionState.none:
                // TODO: Handle this case.
                throw UnimplementedError();
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                // TODO: Handle this case.
                throw UnimplementedError();
              case ConnectionState.done:
                if(snapshot.hasError){
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                }
                final orderDetailData = snapshot.data!["order_detail"];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(title: "${widget.orders["shipping_address"]}", size: 20, color: Colors.black87, fontWeight: FontWeight.bold,),
                    ListCartOverview(cartItems: orderDetailData, user_id: widget.user_id, token: widget.token, onChanged: (p1){}),
                  ],
                );
            }
          })
    );
  }
}
