import 'package:json_annotation/json_annotation.dart';

part 'api_authentication_user_model.g.dart';

@JsonSerializable()
class ApiAuthenticationUserModel {
  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'password')
  final String password;

  ApiAuthenticationUserModel({
    required this.password,
    required this.username,
  });

  factory ApiAuthenticationUserModel.fromJson(Map<String, dynamic> json) =>
      _$ApiAuthenticationUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiAuthenticationUserModelToJson(this);
}
