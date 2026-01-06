class Payment {
  final int id;
  final String name;
  final int status;
  final String created_at;
  final String updated_at;

  Payment({
    required this.id,
    required this.name,
    required this.status,
    required this.created_at,
    required this.updated_at,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
