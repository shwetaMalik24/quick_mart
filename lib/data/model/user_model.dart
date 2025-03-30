import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickmart/domain/entity/user_entity.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() => UserEntity(id: id, name: name, email: email);

  // static UserModel fromEntity(UserEntity entity) => UserModel(
//       id: entity.id,
//       name: entity.name,
//       email: entity.email,
//     );
}
