import 'dart:convert';
import 'package:coffee_shop_test/data/models/banner.dart';
import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:http/http.dart' as http;

class BannerService{
  Future<Map<String, dynamic>> getBanners(String token) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}banners");
      final res = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      final json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return {
          "data": json["data"] ?? []
        };
      } else {
        return {
          "data": [],
          "message": json["message"] ?? "Server error"
        };
      }
    } catch (e) {
      return {
        "data": [],
        "message": e.toString()
      };
    }
  }

  Future<Banner> getBannerById(int id)async{
    try {
      final response = await http.get(Uri.parse("${BaseUrl.baseUrl}banners/$id"));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body)['data'];
        return Banner.fromJson(data);
      }else{
        throw Exception("Lỗi khi tải banner");
      }
    }catch(e){
      throw Exception(e);
    }
  }
}