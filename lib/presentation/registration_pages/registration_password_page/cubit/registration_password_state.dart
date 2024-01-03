part of 'registration_password_cubit.dart';

@immutable
sealed class RegistrationPasswordState {}

final class RegistrationPasswordInitial extends RegistrationPasswordState {}

final class RegistrationUserSuccess extends RegistrationPasswordState {}

final class RegistrationUserError extends RegistrationPasswordState {
  final errorText;
  RegistrationUserError({required this.errorText});
}
