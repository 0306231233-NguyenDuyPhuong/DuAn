import 'dart:convert';

import 'package:coffee_shop_test/data/models/cart_item.dart';
import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:http/http.dart' as http;

class NameProduct {
  final String color;
  final String size;
  NameProduct({required this.color, required this.size});
  Map<String, dynamic> toJson() {
    return {"color": color, "size": size};
  }
}

class CartItemService {
  Future<Map<String, dynamic>> getCartItemByUserId(
    String token,
    int user_id,
  ) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}cart-items/${user_id}");
      final res = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );
      final data = jsonDecode(res.body)["data"];
      if (res.statusCode == 200) {
        return {
          "status":res.statusCode,
          "data": data};
      } else {
        return {"message": data["message"]};
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //Thêm vào cart
  Future<Map<String, dynamic>> postCartItem(
    String token,
    int user_id,
    int quantity,
    List<NameProduct>? nameProduct,
    int? product_variant_id,
  ) async {
    try {
      final baseUri = Uri.parse("${BaseUrl.baseUrl}cart-items");
      final res = await http.post(
        baseUri,
        headers: {
          "Authorization": "Bearer ${token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "user_id": user_id,
          "quantity": quantity,
          "nameProduct": nameProduct?.map((item) => item.toJson()).toList(),
          "product_variant_id": product_variant_id,
        }),
      );
      final data = jsonDecode(res.body);
      print(data);
      if (res.statusCode == 200) {
        return {
          "data": data["data"],
          "status": res.statusCode,
          "message": data["message"],
        };
      } else {
        return {"message": data["message"]};
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  //Check out cart
  Future<Map<String, dynamic>> postCheckoutCart(String token, int user_id,
      int pay_id, int shipper_id, String shipping_address, int total,
      String note) async {
    try {
      final baseUri = Uri.parse("${BaseUrl.baseUrl}cart/checkoutCart");
      final res = await http.post(
        baseUri,
        headers: {"Authorization": "Bearer ${token}",
          "Content-Type": "application/json"},
        body: jsonEncode({
          "user_id": user_id,
          "pay_id": pay_id,
          "shipper_id": shipper_id,
          "shipping_address": shipping_address,
          "total": total,
          "note": note
        }),
      );
      final data = jsonDecode(res.body);
      print(data);
      if (res.statusCode == 200) {
        return {
          "data": data["data"],
          "status": res.statusCode,
          "message": data["message"]
        };
      } else {
        return {
          "message": data["message"]
        };
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
