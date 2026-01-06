class Wish {
  final int user_id;
  final int product_id;
  final String image;
  final String name;
  final String brand;
  final int old_price;
  final int price;
  final bool status;

  Wish(
    this.user_id,
    this.product_id,
    this.image,
    this.name,
    this.brand,
    this.old_price,
    this.price,
      this.status
  );

  factory Wish.fromJson(Map<String, dynamic> json) {
    return Wish(
      json['user_id'],
      json['product_id'],
      json['image'],
      json['name'],
      json['brand'],
      json['old_price'],
      json['price'],
      json["status"]??false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'product_id': product_id,
      'image': image,
      'name': name,
      'brand': brand,
      'old_price': old_price,
      'price': price,
      'status':status??false
    };
  }
}
