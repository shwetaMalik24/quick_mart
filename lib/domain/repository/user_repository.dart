import 'package:quickmart/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> login(String email, String password);
}
