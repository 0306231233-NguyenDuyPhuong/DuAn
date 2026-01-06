import 'package:coffee_shop_test/data/models/banner.dart';
import 'package:coffee_shop_test/data/services/banner_service.dart';

class BannerViewModel{
  final BannerService _bannerService = BannerService();
  Banner? selectedBanner;

  Future<Map<String, dynamic>> getCategories(String token)async{
    final data =await _bannerService.getBanners(token);
    return {
      "banner":data
    };
  }

  /*Future<Banner?> getBannerById(int id) async{
    try{
      selectedBanner = await _bannerService.getBannerById(id);
      return selectedBanner;
    }catch(e){
      throw Exception(e);
    }
  }*/
}