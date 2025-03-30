import 'package:quickmart/domain/entity/user_entity.dart';
import 'package:quickmart/domain/repository/user_repository.dart';

class UserLoginUseCase {
  final UserRepository repository;

  UserLoginUseCase(this.repository);

  Future<UserEntity> execute(String email, String password) {
    return repository.login(email, password);
  }
}
