import 'package:coffee_shop_test/data/models/product_variant_value.dart';
import 'package:coffee_shop_test/data/services/product_variant_value_service.dart';

class ProductVariantValuesViewModel{
  ProductVariantValueService _productVariantValueService = ProductVariantValueService();

  Future<Map<String, dynamic>> getProductVariantValueById(String token,int product_id) async {
      final data = await _productVariantValueService.getProductVariantValueById(token,product_id);
      return {
        "product_variant_value":data
      };
  }
  Future<ProductVariantValue> getProductVariantValueBySku(String sku) async {
    try {
      final selectedProductVariantValue = await _productVariantValueService.getProductVariantValueBySku(sku);
      return selectedProductVariantValue;
    } catch (e) {
      throw Exception(e);
    }
  }

}