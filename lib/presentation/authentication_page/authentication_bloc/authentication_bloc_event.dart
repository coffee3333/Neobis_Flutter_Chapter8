part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationBlocEvent {}

class AuthenticationEvent extends AuthenticationBlocEvent {
  final String userName;
  final String password;

  AuthenticationEvent({required this.userName, required this.password});
}

class UpdateUserNameFieldEvent extends AuthenticationBlocEvent {
  final String newUserName;

  UpdateUserNameFieldEvent({required this.newUserName});
}

class UpdatePasswordFieldEvent extends AuthenticationBlocEvent {
  final String newPassword;

  UpdatePasswordFieldEvent({required this.newPassword});
}

class ErrorEvent extends AuthenticationBloc {
  final bool error;
  final String errorText;

  ErrorEvent({required this.error, required this.errorText});
}
