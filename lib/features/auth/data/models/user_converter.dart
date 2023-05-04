import 'package:learn_auth/features/auth/domain/entities/user.dart';

class UserConverter {
  UserConverter._();
  static final UserConverter _instance = UserConverter._();
  factory UserConverter() => _instance;

  User fromJson(Map<String, Object> json) {
    String id = json['id'] as String;
    String name = json['name'] as String;
    String email = json['email'] as String;
    String birthDate = json['birthDate'] as String;
    String password = json['password'] as String;

    return User(id, name, email, birthDate, password);
  }

  Map<String, Object> toJson(User user) => {
    "id" : user.id,
    "name" : user.name,
    "email" : user.email,
    "birthDate" : user.birthDate,
    "password" : user.password,
  };
}