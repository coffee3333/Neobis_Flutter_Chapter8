import 'package:json_annotation/json_annotation.dart';

part 'api_registration_user_model.g.dart';

@JsonSerializable()
class ApiRegistrationUserModel {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'password')
  final String password;

  ApiRegistrationUserModel({
    required this.email,
    required this.password,
    required this.username,
  });

  factory ApiRegistrationUserModel.fromJson(Map<String, dynamic> json) =>
      _$ApiRegistrationUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiRegistrationUserModelToJson(this);
}
