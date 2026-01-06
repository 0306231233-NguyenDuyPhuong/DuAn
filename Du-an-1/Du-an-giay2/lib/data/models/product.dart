class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final int brandId;
  final int categoryId;
  final int totalSold;
  final String createdAt;
  final String updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.brandId,
    required this.categoryId,
    required this.totalSold,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      brandId: json['brand_id'],
      categoryId: json['category_id'],
      totalSold: json['total_sold'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
