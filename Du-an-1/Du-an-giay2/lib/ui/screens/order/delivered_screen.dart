import 'package:coffee_shop_test/ui/screens/order/widget/evaluate_list_screen.dart';
import 'package:coffee_shop_test/ui/shared/widget/my_text.dart';
import 'package:flutter/material.dart';
import '../../../data/viewmodels/order_detail_viewmodels.dart';

class OrderDetailView extends StatefulWidget {
  final orders;
  final String token;
  final int user_id;
  const OrderDetailView({super.key, required this.orders, required this.token, required this.user_id});

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  late Future<Map<String, dynamic>> _fetchData;
  OrderDetailViewModel orderDetailViewModel = OrderDetailViewModel();

  Future<Map<String, dynamic>> loadData()async{
    final orderData = await orderDetailViewModel.getOrderDetail(widget.token, widget.orders["id"]);
    return {
      "order_detail":orderData,
    };
  }
  final txtComment = TextEditingController();
  int? seletedIndex = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData = loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(title: "Delivered", size: 25, color: Colors.black87, fontWeight: FontWeight.bold,),
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
                return Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EvaluateListScreen(cartItems: orderDetailData, user_id: widget.user_id, token: widget.token, onChanged: (p1){}),
                    ],
                  ),
                );
            }
          })
    );
  }
}

/*
* */