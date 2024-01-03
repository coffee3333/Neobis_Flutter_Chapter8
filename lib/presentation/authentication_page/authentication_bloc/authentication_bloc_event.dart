part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationBlocEvent {}

class AuthenticationEvent extends AuthenticationBlocEvent {
  final String userName;
  final String password;

  AuthenticationEvent({required this.userName, required this.password});
}
