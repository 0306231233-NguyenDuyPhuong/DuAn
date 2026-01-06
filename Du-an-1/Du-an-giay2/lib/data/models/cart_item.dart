import 'package:coffee_shop_test/data/models/product_variant_value.dart';

class CartItem {
  final int id;
  final int user_id;
  final int product_variant_id;
  final int quantity;
  final ProductVariantValue?productVariantValue;
  final String created_at;
  final String updated_at;

  CartItem({
    required this.id,
    required this.user_id,
    required this.product_variant_id,
    required this.quantity,
    this.productVariantValue,
    required this.created_at,
    required this.updated_at,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      user_id: json['user_id'],
      product_variant_id: json['product_variant_id'],
      quantity: json['quantity'],
      productVariantValue: json['product_variant_value'] != null?ProductVariantValue.fromJson(json['product_variant_value']):null,
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
