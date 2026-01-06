import 'package:coffee_shop_test/data/viewmodels/product_viewmodels.dart';
import 'package:coffee_shop_test/data/viewmodels/user_viewmodels.dart';
import 'package:coffee_shop_test/data/viewmodels/wish_viewmodels.dart';

import 'banner_viewmodels.dart';
import 'category_viewmodels.dart';

class HomeViewModel{
  CategoryViewModel categoryViewModel = CategoryViewModel();
  BannerViewModel bannerViewModel = BannerViewModel();
  ProductViewModel productViewModel = ProductViewModel();
  UserViewModel userViewModel = UserViewModel();
  WishViewModel wishViewModel = WishViewModel();

  Future<Map<String, dynamic>> fechAllDataHome(String token, int category_id) async {
    final results = await Future.wait([
      userViewModel.userProfile(token),
      categoryViewModel.getCategories(token),
      //bannerViewModel.getCategories(token),
      productViewModel.getProduct(token, category_id, 1, ""),
      wishViewModel.loadWishList()
    ]);

    return {
      'users': results[0],
      'categories': results[1],
      'banners': results[2],
      'products': results[3],
      //'wishs':results[4]
    };
  }
}