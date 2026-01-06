class ProductImage {
  final int id;
  final int product_id;
  final String image_url;
  final String created_at;
  final String updated_at;

  ProductImage({
    required this.id,
    required this.product_id,
    required this.image_url,
    required this.created_at,
    required this.updated_at,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      product_id: json['product_id'],
      image_url: json['image_url'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
