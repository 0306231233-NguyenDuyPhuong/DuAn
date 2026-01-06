import 'dart:convert';
import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:http/http.dart' as http;

class VariantValueService{
  Future<Map<String, dynamic>> getVariantValue(String token) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}variant-values");
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