import 'package:quickmart/data/model/user_model.dart';
import 'package:quickmart/data/data_source/user_remote_data_source.dart';
import 'package:quickmart/domain/entity/user_entity.dart';
import 'package:quickmart/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> login(String email, String password) async {
    UserModel userModel = await remoteDataSource.login(email, password);
    return userModel.toEntity();
  }
}
