import 'package:json_annotation/json_annotation.dart';

part 'api_registration_check_user_model.g.dart';

@JsonSerializable()
class ApiRegistrationCheckUserModel {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'username')
  final String username;

  ApiRegistrationCheckUserModel({
    required this.email,
    required this.username,
  });

  factory ApiRegistrationCheckUserModel.fromJson(Map<String, dynamic> json) =>
      _$ApiRegistrationCheckUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiRegistrationCheckUserModelToJson(this);
}
