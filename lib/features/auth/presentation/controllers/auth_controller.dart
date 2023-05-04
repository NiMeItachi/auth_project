import 'package:flutter/cupertino.dart';
import 'package:learn_auth/features/auth/domain/entities/user.dart';
import 'package:learn_auth/features/auth/domain/repositories/auth_respository.dart';

class AuthController {

  AuthController._();
  static final AuthController _instance = AuthController._();
  factory AuthController(AuthRepository repository) {
    authRepository = repository;
    return _instance;
  }

  static late final AuthRepository authRepository;

  Map<String, String> registration(TextEditingController nameController, TextEditingController emailController, TextEditingController birthDateController, TextEditingController passwordController) {
    Map<String, String> result = {};
    
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String birthDate = birthDateController.text.trim();
    String password = passwordController.text.trim();
    
    if(!name.startsWith(RegExp(r"^[A-Z].{3,}$"))) {
      result["message"] = "Wrong Name";
      result["next"] = "not";
    }
    
    if(!email.contains(RegExp(r'^([a-zA-Z\d._%+-]+)@([a-zA-Z\d.-]+\.[a-zA-Z]{2,})$'))) {
      result["message"] = "Wrong Email";
      result["next"] = "not";
    }

    if(!birthDate.contains(RegExp(r'^[0-9]{2}\.[0-9]{2}\.[0-9]{4}$'))) {
      result["message"] = "Wrong BirthDate";
      result["next"] = "not";
    }

    if(!password.contains(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$'))) {
      result["message"] = "Wrong Password";
      result["next"] = "not";
    }


    final user = User("00", name, email, birthDate, password);
    final response = authRepository.signUp(user);
    result["message"] = response["message"] as String;
    result["next"] = (response["success"] as bool) ? "next" : "not";
    return result;
  }
}