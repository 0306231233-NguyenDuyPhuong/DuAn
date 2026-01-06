class FeedbackModel {
  final int? id;
  final int? product_id;
  final int? user_id;
  final int? star;
  final String? content;
  final String? created_at;
  final String? updated_at;

  FeedbackModel({
     this.id,
     this.product_id,
     this.user_id,
     this.star,
     this.content,
     this.created_at,
     this.updated_at,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['id'],
      product_id: json['product_id'],
      user_id: json['user_id'],
      star: json['star'],
      content: json['content'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
   return {
     "product_id": product_id,
     "user_id": user_id,
     "star": star,
     "content": content,
   };
  }
}
