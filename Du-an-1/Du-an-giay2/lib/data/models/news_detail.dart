class NewsDetail {
  final int id;
  final int product_id;
  final int news_id;
  final String created_at;
  final String updated_at;

  NewsDetail({
    required this.id,
    required this.product_id,
    required this.news_id,
    required this.created_at,
    required this.updated_at,
  });

  factory NewsDetail.fromJson(Map<String, dynamic> json) {
    return NewsDetail(
      id: json['id'],
      product_id: json['product_id'],
      news_id: json['news_id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
