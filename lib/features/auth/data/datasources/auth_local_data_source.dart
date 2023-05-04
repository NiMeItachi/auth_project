import 'dart:convert';
import 'package:learn_auth/core/library/local_storage.dart';

abstract class AuthLocalDataSource {
  factory AuthLocalDataSource({required LocalStorage storage})
      => AuthLocalDataSourceImpl(storage: storage);

  Map<String, Object> signUp(String name, Map<String, Object> data);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {

  final LocalStorage storage;
  AuthLocalDataSourceImpl({required this.storage});

  @override
  Map<String, Object> signUp(String name, Map<String, Object> data) {
    String json = jsonEncode(data);
    bool success = storage.storeData(key: name, value: json);
    return {
      "message": "Successfully registration!!!",
      "success": success,
      "data": "no-data",
    };
  }
}