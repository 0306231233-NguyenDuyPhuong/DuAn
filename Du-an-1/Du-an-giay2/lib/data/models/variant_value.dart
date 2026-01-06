class VariantValue {
  final int id;
  final int variant_id;
  final String value;
  final String image;
  final String created_at;
  final String updated_at;

  VariantValue({
    required this.id,
    required this.variant_id,
    required this.value,
    required this.image,
    required this.created_at,
    required this.updated_at,
  });

  factory VariantValue.fromJson(Map<String, dynamic> json) {
    return VariantValue(
      id: json['id'],
      variant_id: json['variant_id'],
      value: json['value'],
      image: json['image'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
