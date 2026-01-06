class Attribute {
  final int id;
  final String name;
  final String created_at;
  final String updated_at;

  Attribute({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      name: json['name'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
