import 'package:coffee_shop_test/data/models/wish.dart';
import 'package:coffee_shop_test/data/services/wish_service.dart';
import 'package:flutter/cupertino.dart';

class WishViewModel extends ChangeNotifier{
  WishService wishService = WishService();
  List<Wish> wishList = [];

  Future<void> saveWish(List<Wish> listWish)async{
     return await wishService.saveWish(listWish);
  }
  Future<List<Wish>> loadWishList()async{
    return await wishService.loadWishList();
  }
  Future<List<Wish>> loadWishById(int product_id)async{
    return await wishService.loadWishById(product_id);
  }
  
  Future<void> deleteWish(int product_id)async{
    return await wishService.deleteWish(product_id);
  }
  Future<void> addWish(Wish wish)async{
    return await wishService.addWish(wish);
  }
}