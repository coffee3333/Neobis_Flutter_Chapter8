part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationBlocState {}

class AuthenticationBlocInitial extends AuthenticationBlocState {}

class UpdateUserNameFieldState extends AuthenticationBlocState {
  final String newUserName;

  UpdateUserNameFieldState({required this.newUserName});
}

class UpdatePasswordFieldState extends AuthenticationBlocState {
  final String newUserName;

  UpdatePasswordFieldState({required this.newUserName});
}

class AuthenticationErrorState extends AuthenticationBlocState {
  final bool error;
  final String errorText;

  AuthenticationErrorState({required this.error, required this.errorText});
}

class AuthenticationSuccessState extends AuthenticationBlocState {}
