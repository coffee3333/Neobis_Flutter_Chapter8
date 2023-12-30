// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_registration_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRegistrationUserModel _$ApiRegistrationUserModelFromJson(
        Map<String, dynamic> json) =>
    ApiRegistrationUserModel(
      email: json['email'] as String,
      password: json['password'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$ApiRegistrationUserModelToJson(
        ApiRegistrationUserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
