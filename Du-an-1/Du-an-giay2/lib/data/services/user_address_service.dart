import 'dart:convert';

import 'package:coffee_shop_test/data/models/user_address.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'baseurl.dart';

class UserAddressService{
  static String key = "user_address";

  Future<Map<String, dynamic>> getUserAddress(String token) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}user-address");
      final res = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );
      final data = jsonDecode(res.body)["data"];
      if (res.statusCode == 200) {
        return {
          "data": data
        };
      }
      else {
        return {
          "message": data["message"]
        };
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> postUserAddress(String token,UserAddress userAddress) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}user-address");
      final res = await http.post(
          url,
          headers: {"Content-Type":"application/json", "Authorization":"Bearer $token"},
          body: jsonEncode(userAddress.toJson())
      );
      final data = jsonDecode(res.body)['data'];
      print(data);
      if(res.statusCode == 200){
        return{
          "status":res.statusCode,
          "token":data["token"]
        };
      }
      else{
        return{
          "status":res.statusCode,
        };
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveUserAddress(String key, Map<String, dynamic> value) async{
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(value);
    await prefs.setString(key, jsonString);
  }

  Future<Map<String, dynamic>?> getAddress(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    if (jsonString == null) return null;
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }

}