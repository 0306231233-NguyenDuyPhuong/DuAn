import 'dart:convert';

import 'package:coffee_shop_test/data/services/baseurl.dart';
import 'package:http/http.dart' as http;

import '../models/product_variant_value.dart';
class ProductVariantValueService{
  Future<List<ProductVariantValue>> getAllProductVariantValue()async{
    try{
      final response = await http.get(Uri.parse("${BaseUrl.baseUrl}product-variant-values"));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body)['data'];
        return (data as List).map((e)=>ProductVariantValue.fromJson(e)).toList();
      }else{
        throw Exception("Lỗi khi tải product variant values");
      }
    }catch(e){
      throw Exception(e);
    }
  }
  
  Future<Map<String, dynamic>> getProductVariantValueById(String token,int product_id)async{
      try {
        final url =Uri.parse("${BaseUrl.baseUrl}product-variant-values/${product_id}");
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

  Future<ProductVariantValue> getProductVariantValueBySku(String sku)async{
    try{
      final response = await http.get(Uri.parse("${BaseUrl.baseUrl}product-variant-values/sku/${sku}"));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body)['data'];
        return ProductVariantValue.fromJson(data);
      }else{
        throw Exception("Lỗi khi tải data");
      }
    }catch(e){
      throw Exception(e);
    }
  }
}