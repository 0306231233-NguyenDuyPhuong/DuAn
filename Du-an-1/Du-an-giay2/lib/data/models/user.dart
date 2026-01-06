class User {
  final int? id;
  final String? email;
  final String? password;
  final String? name;
  final int? role;
  final String? avatar;
  final String? phone;
  final int? status;
  final String? fullname;
  final bool? gender;
  final String? birth;

  User({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.phone,
    this.status,
    this.fullname,
    this.gender,
    this.birth,
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      name: json['name']?.toString(),
      role: json['role'],
      avatar: json['avatar']?.toString(),
      phone: json['phone']?.toString(),
      status: json['status'],
      fullname: json['fullname']?.toString(),
      gender: json['gender'],
      birth: json['birth']?.toString(),
    );
  }

  Map<String, dynamic> toLogin(){
    return {
      'phone':phone,
      'password':password
    };
  }

  Map<String, dynamic> toRegister(){
    return {
      'name':name,
      'phone':phone,
      'password':password
    };
  }

  Map<String, dynamic> toUpdate() {
    final data = <String, dynamic>{};
    if (email != null) data["email"] = email;
    if (password != null) data["password"] = password;
    if (name != null) data["name"] = name;
    if (role != null) data["role"] = role;
    if (avatar != null) data["avatar"] = avatar;
    if (phone != null) data["phone"] = phone;
    if (status != null) data["status"] = status;
    if (fullname != null) data["fullname"] = fullname;
    if (gender != null) data["gender"] = gender;
    if (birth != null) data["birth"] = birth;

    return data;
  }


}
