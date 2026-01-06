class Category {
  final int id;
  final String name;
  final String image;
  final String created_at;
  final String updated_at;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.created_at,
    required this.updated_at,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
