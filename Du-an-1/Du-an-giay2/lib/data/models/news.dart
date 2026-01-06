class News {
  final int id;
  final String title;
  final String image;
  final String content;
  final String created_at;
  final String updated_at;

  News({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.created_at,
    required this.updated_at,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      content: json['content'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
