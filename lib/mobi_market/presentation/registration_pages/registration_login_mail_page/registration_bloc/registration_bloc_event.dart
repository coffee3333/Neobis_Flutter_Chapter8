part of 'registration_bloc.dart';

@immutable
abstract class RegistrationBlocEvent {}

class MailAndUsernameCheckEvent extends RegistrationBlocEvent {
  final String userName;
  final String email;

  MailAndUsernameCheckEvent({required this.userName, required this.email});
}

class InEvent extends RegistrationBlocEvent {}
