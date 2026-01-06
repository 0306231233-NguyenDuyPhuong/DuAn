class OrderDetail {
  final int id;
  final int order_id;
  final int product_variant_id;
  final double price;
  final int quantity;
  final String created_at;
  final String updated_at;

  OrderDetail({
    required this.id,
    required this.order_id,
    required this.product_variant_id,
    required this.price,
    required this.quantity,
    required this.created_at,
    required this.updated_at,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      order_id: json['order_id'],
      product_variant_id: json['product_variant_id'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
