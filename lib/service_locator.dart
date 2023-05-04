import 'package:learn_auth/core/library/local_storage.dart';
import 'package:learn_auth/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:learn_auth/features/auth/data/models/user_converter.dart';
import 'package:learn_auth/features/auth/domain/repositories/auth_respository.dart';
import 'package:learn_auth/features/auth/presentation/controllers/auth_controller.dart';

late final AuthController authController;

// Service Locator pattern and Dependency Injection pattern
void setupLocator() {
  // init
  final userConverter = UserConverter();
  final storage = LocalStorage();
  final dataSource = AuthLocalDataSource(storage: storage);
  final repository = AuthRepository(dataSource: dataSource, userConverter: userConverter);
  authController = AuthController(repository);
}