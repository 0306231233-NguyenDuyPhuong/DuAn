class Banner {
  final int id;
  final String name;
  final String image;
  final int status;
  final String created_at;
  final String updated_at;

  Banner({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.created_at,
    required this.updated_at,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
