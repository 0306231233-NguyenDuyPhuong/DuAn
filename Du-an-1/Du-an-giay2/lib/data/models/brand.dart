class Brand {
  final int id;
  final String name;
  final String image;
  final String created_at;
  final String updated_at;

  Brand({
    required this.id,
    required this.name,
    required this.image,
    required this.created_at,
    required this.updated_at,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
