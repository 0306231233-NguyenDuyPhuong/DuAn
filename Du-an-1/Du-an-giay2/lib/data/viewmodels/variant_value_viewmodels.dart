import 'package:coffee_shop_test/data/services/variant_value_service.dart';

class VariantValueViewModel{
  final VariantValueService variantValueService = VariantValueService();

  Future<Map<String, dynamic>> getVariantValues(String token)async{
      final data =await variantValueService.getVariantValue(token);

      return {
        "variant_value":data
      };
  }
}