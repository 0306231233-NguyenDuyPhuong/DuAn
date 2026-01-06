import 'dart:convert';
import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:http/http.dart' as http;
class OrderService{
  Future<Map<String, dynamic>> getOrders(String token) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}order");
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