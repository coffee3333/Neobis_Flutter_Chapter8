part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationBlocState {}

class AuthenticationBlocInitial extends AuthenticationBlocState {}

class AuthenticationErrorState extends AuthenticationBlocState {
  final String errorText;

  AuthenticationErrorState({required this.errorText});
}

class AuthenticationSuccessState extends AuthenticationBlocState {}
