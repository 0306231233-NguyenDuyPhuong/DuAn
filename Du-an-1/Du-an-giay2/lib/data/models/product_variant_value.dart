import 'package:coffee_shop_test/data/models/product.dart';
import 'package:coffee_shop_test/data/models/variant_value.dart';
class ProductVariantValue {
  final int id;
  final int product_id;
  final String price;
  final String old_price;
  final int stock;
  final String sku;
  final Product product;

  ProductVariantValue({
    required this.id,
    required this.product_id,
    required this.price,
    required this.old_price,
    required this.stock,
    required this.sku,
    required this.product,
  });

  factory ProductVariantValue.fromJson(Map<String, dynamic> json) {
    return ProductVariantValue(
      id: json["id"],
      product_id: json["product_id"],
      price: json["price"],
      old_price: json["old_price"],
      stock: json["stock"],
      sku: json["sku"],
      product: Product.fromJson(json["product"]),
    );
  }
}
