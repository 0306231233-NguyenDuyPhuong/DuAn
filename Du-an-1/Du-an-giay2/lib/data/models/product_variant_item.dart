class ProductVariantItem {
  final int id;
  final int product_variant_id;
  final int variant_value_id;

  ProductVariantItem({
    required this.id,
    required this.product_variant_id,
    required this.variant_value_id,
  });

  factory ProductVariantItem.fromJson(Map<String, dynamic> json) {
    return ProductVariantItem(
      id: json['id'],
      product_variant_id: json['product_variant_id'],
      variant_value_id: json['variant_value_id'],
    );
  }
}
