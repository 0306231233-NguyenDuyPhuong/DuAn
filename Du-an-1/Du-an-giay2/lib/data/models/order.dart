class Order {
  final int id;
  final int user_id;
  final int pay_id;
  final int shipper_id;
  final String shipping_address;
  final int status;
  final String note;
  final double total;
  final String created_at;
  final String updated_at;

  Order({
    required this.id,
    required this.user_id,
    required this.pay_id,
    required this.shipper_id,
    required this.shipping_address,
    required this.status,
    required this.note,
    required this.total,
    required this.created_at,
    required this.updated_at,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      user_id: json['user_id'],
      pay_id: json['pay_id'],
      shipper_id: json['shipper_id'],
      shipping_address: json['shipping_address'],
      status: json['status'],
      note: json['note'],
      total: (json['total'] as num).toDouble(),
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
