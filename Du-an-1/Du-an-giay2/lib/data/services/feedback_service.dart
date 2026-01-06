import 'dart:convert';
import 'package:coffee_shop_test/data/models/feedback.dart';
import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class FeedbackService{
  Future<Map<String, dynamic>> getFeedBacks(String token, int product_id) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}feedbacks?product_id=$product_id");
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

  Future<Map<String, dynamic>> postFeedBack(String token, FeedbackModel feedback) async {
    try {
      print("------------------------");
      print(feedback.toJson());
      final url = Uri.parse("${BaseUrl.baseUrl}feedbacks");
      final res = await http.post(
        url,
        headers: {
          "Authorization":"Bearer $token",
          "Content-Type":"application/json"
        },

        body: jsonEncode(feedback.toJson())
      );
      final data = jsonDecode(res.body)["data"];
      if(res.statusCode == 200){
        return{
          "status":res.statusCode,
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