import 'package:get_it/get_it.dart';
import 'package:quickmart/data/data_source/user_remote_data_source.dart';
import 'package:quickmart/data/repository/user_repository_impl.dart.dart';
import 'package:quickmart/domain/use_case/user_use_case.dart';
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

  getIt.registerLazySingleton<UserLoginUseCase>(
    () => UserLoginUseCase(
      getIt<UserRepositoryImpl>(),
    ),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt<UserLoginUseCase>(),
    ),
  );
}
