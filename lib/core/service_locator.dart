import 'package:get_it/get_it.dart';
import 'package:quickmart/data/data_source/user_remote_data_source.dart';
import 'package:quickmart/data/repository/user_repository_impl.dart.dart';
import 'package:quickmart/presentation/user/user_login/bloc/login_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(),
  );
  getIt.registerLazySingleton<UserRepositoryImpl>(
    () => UserRepositoryImpl(
      getIt<UserRemoteDataSource>(),
    ),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt<UserRepositoryImpl>(),
    ),
  );
}
