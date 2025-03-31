import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickmart/domain/entity/user_entity.dart';
import 'package:quickmart/domain/use_case/user_use_case.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserLoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(const LoginState.loading());
      final user =
          await _loginUseCase.execute(email, password); // ✅ Calls Use Case
      emit(LoginState.success(user));
    } catch (e) {
      emit(LoginState.failure(e.toString()));
    }
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;

  const factory LoginState.loading() = LoginLoading;

  const factory LoginState.success(UserEntity user) = LoginSuccess;

  const factory LoginState.failure(String error) = LoginFailure;
}
