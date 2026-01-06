import 'dart:convert';

import 'package:coffee_shop_test/data/models/wish.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishService{
  final String keyWish = "list_wish";
  Future<void> saveWish(List<Wish> listWish) async{
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonList = listWish.map((item)=>jsonEncode(item.toJson())).toList();
    await prefs.setStringList(keyWish, jsonList);
  }

  Future<List<Wish>> loadWishList()async{
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(keyWish)??[];
    return jsonList
        .map((item)=>Wish.fromJson(jsonDecode(item)))
        .toList();
  }

  Future<List<Wish>> loadWishById(int product_id)async{
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(keyWish)??[];
    return jsonList
        .map((item)=>Wish.fromJson(jsonDecode(item)))
        .where((item)=>item.product_id == product_id)
        .toList();
  }

  Future<void> deleteWish(int product_id)async{
    List<Wish> list = await loadWishList();
    list.removeWhere((item)=>item.product_id == product_id);
    saveWish(list);
  }

  Future<void> addWish(Wish wish)async{
    List<Wish> list = await loadWishList();
    list.add(wish);
    saveWish(list);
  }
}