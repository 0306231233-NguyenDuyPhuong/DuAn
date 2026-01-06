import 'dart:convert';

import 'package:coffee_shop_test/data/models/product_image.dart';
import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:http/http.dart' as http;

class ProductImageService{
  Future<Map<String, dynamic>> getProductImage(String token) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}product-images");
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
  

    Future<Map<String, dynamic>> getProductImageById(String token, int product_id) async {
      try {
        final url =Uri.parse("${BaseUrl.baseUrl}product-images/${product_id}");
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