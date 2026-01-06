class UserAddress {
  final int id;
  final int user_id;
  final String full_name;
  final String phone;
  final String address;
  final String city;
  final String district;
  final String ward;
  final bool is_default;
  final String created_at;
  final String updated_at;

  UserAddress({
    required this.id,
    required this.user_id,
    required this.full_name,
    required this.phone,
    required this.address,
    required this.city,
    required this.district,
    required this.ward,
    required this.is_default,
    required this.created_at,
    required this.updated_at,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      id: json['id'],
      user_id: json['user_id'],
      full_name: json['full_name'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      district: json['district'],
      ward: json['ward'],
      is_default: json['is_default'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'full_name': full_name,
      'phone': phone,
      'address': address,
      'city': city,
      'district': district,
      'ward': ward,
    };
  }
}
