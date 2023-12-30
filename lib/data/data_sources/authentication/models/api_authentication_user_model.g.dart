// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_authentication_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAuthenticationUserModel _$ApiAuthenticationUserModelFromJson(
        Map<String, dynamic> json) =>
    ApiAuthenticationUserModel(
      password: json['password'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$ApiAuthenticationUserModelToJson(
        ApiAuthenticationUserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
