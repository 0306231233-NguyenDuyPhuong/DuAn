import 'dart:convert';

import 'package:coffee_shop_test/data/models/product.dart';
import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:http/http.dart' as http;

class ProductService{
  Future<Map<String, dynamic>> getProduct(String token, int? category_id, int page, String search) async {
    try {
      // Base URL
      String base = "${BaseUrl.baseUrl}products?";

      // Thêm page
      base += "page=$page";

      // Nếu có category_id thì thêm vào
      if (category_id != null && category_id != -1) {
        base += "&category_id=$category_id";
      }

      // Nếu có search thì thêm vào
      if (search.isNotEmpty) {
        base += "&search=$search";
      }

      final url = Uri.parse(base);

      final res = await http.get(
        url,
        headers: {"Authorization":"Bearer $token"},
      );
      final data = jsonDecode(res.body);
      if(res.statusCode == 200){
        return{
          "data":data["data"],
          "totalPages":data["totalPages"]
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

  Future<Map<String, dynamic>> getProductById(String token, int id) async {
    try {
      String base = "${BaseUrl.baseUrl}products/$id";
      final url = Uri.parse(base);
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
          "message":data
        };
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}