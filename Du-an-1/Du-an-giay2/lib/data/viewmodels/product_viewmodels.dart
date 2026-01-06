import 'package:coffee_shop_test/data/models/product.dart';
import 'package:coffee_shop_test/data/services/product_service.dart';

class ProductViewModel{
  ProductService _productService = ProductService();
  List<Product> productList = [];
  Product? selectedProdcut;

  Future<Map<String, dynamic>> getProduct(String token, int category_id, int page, String search)async{
    final data =await _productService.getProduct(token, category_id, page, search);
    return {
      "product":data
    };
  }

  Future<Map<String, dynamic>> getProductById(String token, int id)async{
    final data =await _productService.getProductById(token, id);
    return {
      "product":data
    };
  }
}