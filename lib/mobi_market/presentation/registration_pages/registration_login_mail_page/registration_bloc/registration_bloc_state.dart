part of 'registration_bloc.dart';

@immutable
abstract class RegistrationBlocState {}

class RegistrationBlocInitial extends RegistrationBlocState {}

class RegistrationErrorState extends RegistrationBlocState {
  final String errorText;

  RegistrationErrorState({required this.errorText});
}

class RegistrationSuccessState extends RegistrationBlocState {}

class CheckUserNameAndMailSuccessState extends RegistrationBlocState {}

class CheckUserNameAndMailErrorState extends RegistrationBlocState {
  final String errorText;

  CheckUserNameAndMailErrorState({required this.errorText});
}

class InEventState extends RegistrationBlocState {}
