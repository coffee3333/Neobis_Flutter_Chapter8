part of 'registration_login_mail_cubit.dart';

@immutable
sealed class RegistrationLoginMailState {}

final class RegistrationLoginMailInitial extends RegistrationLoginMailState {}

final class CheckUserSuccessState extends RegistrationLoginMailState {}

final class CheckUserErrorState extends RegistrationLoginMailState {
  final String errorText;

  CheckUserErrorState({required this.errorText});
}
