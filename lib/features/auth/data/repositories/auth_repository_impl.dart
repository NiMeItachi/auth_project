import 'package:learn_auth/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:learn_auth/features/auth/data/models/user_converter.dart';
import 'package:learn_auth/features/auth/domain/entities/user.dart';
import 'package:learn_auth/features/auth/domain/repositories/auth_respository.dart';

class AuthRepoImpl implements AuthRepository {

  final AuthLocalDataSource dataSource;
  final UserConverter userConverter;

  AuthRepoImpl({required this.dataSource, required this.userConverter});


  @override
  Map<String, Object> signUp(User user) {
    final data = userConverter.toJson(user);
    return dataSource.signUp(user.name, data);
  }
}