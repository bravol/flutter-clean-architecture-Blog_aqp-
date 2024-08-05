import 'package:fca_blog_app/features/auth/entities/user.dart';

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
}
