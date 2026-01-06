import 'package:coffee_shop_test/data/models/user.dart';
import 'package:coffee_shop_test/data/services/user_service.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier{
  UserService userService = UserService();

  Future<Map<String, dynamic>> userProfile(String token)async{
    final data =await userService.getUserProfile(token);
    return {
      "user":data
    };
  }

  Future<Map<String, dynamic>> userLogin(User user)async{
    final data =await userService.postUserLogin(user);
    return {
      "login":data
    };
  }

  Future<Map<String, dynamic>> userRegister(User user)async{
    final data =await userService.postUserRegister(user);
    return {
      "register":data
    };
  }

  Future<Map<String, dynamic>> putUserUpdate(int user_id,String token, User user)async{
    final data =await userService.putUserUpdate(user_id,token, user);
    notifyListeners();
    print(data);
    return {
      "data":data
    };
  }
}