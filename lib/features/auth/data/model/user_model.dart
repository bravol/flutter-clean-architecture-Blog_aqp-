import 'package:fca_blog_app/core/common/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.email,
    required super.id,
    required super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  UserModel copyWith({
    String? email,
    String? id,
    String? name,
  }) {
    return UserModel(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
