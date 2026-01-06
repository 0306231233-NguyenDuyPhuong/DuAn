import 'package:coffee_shop_test/data/models/product_image.dart';
import 'package:coffee_shop_test/data/services/product_image_service.dart';

class ProductImageViewModel{
  final ProductImageService productImageService = ProductImageService();
  Future<Map<String, dynamic>> getProductImageById(String token,int product_id)async{
    try{
      final data =await productImageService.getProductImageById(token, product_id);
      return {
        "product_images":data
      };
    }catch(e){
      throw Exception(e);
    }
  }
}