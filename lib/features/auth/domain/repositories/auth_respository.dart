import 'package:learn_auth/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:learn_auth/features/auth/data/models/user_converter.dart';
import 'package:learn_auth/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:learn_auth/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  factory AuthRepository({required AuthLocalDataSource dataSource, required UserConverter userConverter})
      => AuthRepoImpl(dataSource: dataSource, userConverter: userConverter);

  /// TODO: Keyinroq yozamiz:
  // signIn();
  Map<String, Object> signUp(User user);
  // forgotPassword();
  // singOut();
  // deleteAccount();
  // editProfile();
  // viewProfile();
}