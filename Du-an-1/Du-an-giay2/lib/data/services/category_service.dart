import 'dart:convert';

import 'package:coffee_shop_test/data/models/category.dart';
import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:http/http.dart' as http;

class CategoryService{
  Future<Map<String, dynamic>> getCategories(String token) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}categories");
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

  Future<Category> getCategoryById(int id)async{
    try{
      final response = await http.get(Uri.parse("${BaseUrl.baseUrl}categories/${id}"));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body)['data'];
        return Category.fromJson(data);
      }else{
        throw Exception("Lỗi khi tải category");
      }
    }catch(e){
      throw Exception(e);
    }
  }
}