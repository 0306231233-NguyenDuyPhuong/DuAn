class Shipper {
  final int id;
  final String name;
  final String phone;
  final int status;
  final String created_at;
  final String updated_at;

  Shipper({
    required this.id,
    required this.name,
    required this.phone,
    required this.status,
    required this.created_at,
    required this.updated_at,
  });

  factory Shipper.fromJson(Map<String, dynamic> json) {
    return Shipper(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      status: json['status'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
