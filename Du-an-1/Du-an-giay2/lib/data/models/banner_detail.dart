class BannerDetail {
  final int id;
  final int product_id;
  final int banner_id;
  final String created_at;
  final String updated_at;

  BannerDetail({
    required this.id,
    required this.product_id,
    required this.banner_id,
    required this.created_at,
    required this.updated_at,
  });

  factory BannerDetail.fromJson(Map<String, dynamic> json) {
    return BannerDetail(
      id: json['id'],
      product_id: json['product_id'],
      banner_id: json['banner_id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
