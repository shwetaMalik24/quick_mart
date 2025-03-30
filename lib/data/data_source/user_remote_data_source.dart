import 'package:quickmart/data/model/user_model.dart';

class UserRemoteDataSource {
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email == "test@example.com" && password == "password123") {
      return UserModel(id: "1", name: "John Doe", email: email);
    } else {
      throw Exception("Invalid email or password");
    }
  }
}
