import 'dart:convert';

import 'package:coffee_shop_test/data/models/order_detail.dart';
import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:http/http.dart' as http;
class OrderDetailService{
  Future<Map<String, dynamic>> getOrderDetails(String token, int order_id) async {
    try {

      var url = Uri.parse("${BaseUrl.baseUrl}order-details");
      if(order_id!=-1){
          url = Uri.parse("${BaseUrl.baseUrl}order-details?order_id=${order_id}");
      }
      final res = await http.get(
        url,
        headers: {"Authorization":"Bearer $token"},
      );
      final data = jsonDecode(res.body)["data"];
      if(res.statusCode == 200){
        return{
          "data":data
        };
      }
      else{
        return{
          "message":data["message"]
        };
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}