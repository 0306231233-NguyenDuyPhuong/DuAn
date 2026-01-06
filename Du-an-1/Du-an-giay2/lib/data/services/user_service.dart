

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';
import 'baseurl.dart';

class UserService {
  Future<Map<String, dynamic>> getUserProfile(String token) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}users/profile");
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

  Future<Map<String, dynamic>> postUserLogin(User user) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}users/login");
      final res = await http.post(
          url,
          headers: {"Content-Type":"application/json"},
          body: jsonEncode(user.toLogin())
      );
      final data = jsonDecode(res.body)["data"];
      if(res.statusCode == 200){
        return{
          "status":res.statusCode,
          "token":data["token"]
        };
      }
      else{
        return{
          "status":res.statusCode
        };
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> postUserRegister(User user) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}users/register");
      final res = await http.post(
          url,
          headers: {"Content-Type":"application/json"},
          body: jsonEncode(user.toRegister())
      );
      final data = jsonDecode(res.body)["data"];
      if(res.statusCode == 201){
        return{
          "status":res.statusCode,
          "token":data["token"]
        };
      }
      else{
        return{
          "status":res.statusCode
        };
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> putUserUpdate(int user_id,String token, User user) async {
    try {
      final url = Uri.parse("${BaseUrl.baseUrl}users/$user_id");

      final res = await http.put(
          url,
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          },
          body: jsonEncode(user.toUpdate())
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
          "status":res.statusCode,
          "message":data
        };
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

