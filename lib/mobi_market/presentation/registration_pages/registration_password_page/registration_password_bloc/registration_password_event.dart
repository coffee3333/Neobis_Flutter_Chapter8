part of 'registration_password_bloc.dart';

@immutable
sealed class RegistrationPasswordEvent {}

class ObscureFieldsEvent extends RegistrationPasswordEvent {
  final bool buttonActive;
  final bool stateObscure;
  final bool errorState;
  final String firstFieldValue;
  final String secondFieldValue;

  ObscureFieldsEvent({
    required this.buttonActive,
    required this.stateObscure,
    required this.errorState,
    required this.firstFieldValue,
    required this.secondFieldValue,
  });
}

class OnChangeFirstFieldEvent extends RegistrationPasswordEvent {
  final bool buttonActive;
  final bool stateObscure;
  final bool errorState;
  final String firstFieldValue;
  final String secondFieldValue;

  OnChangeFirstFieldEvent({
    required this.buttonActive,
    required this.stateObscure,
    required this.errorState,
    required this.firstFieldValue,
    required this.secondFieldValue,
  });
}

class OnChangeSecondFieldEvent extends RegistrationPasswordEvent {
  final bool buttonActive;
  final bool stateObscure;
  final bool errorState;
  final String firstFieldValue;
  final String secondFieldValue;

  OnChangeSecondFieldEvent({
    required this.buttonActive,
    required this.stateObscure,
    required this.errorState,
    required this.firstFieldValue,
    required this.secondFieldValue,
  });
}

class OnButtonEvent extends RegistrationPasswordEvent {
  final bool buttonActive;
  final bool stateObscure;
  final bool errorState;
  final String firstFieldValue;
  final String secondFieldValue;

  OnButtonEvent({
    required this.buttonActive,
    required this.stateObscure,
    required this.errorState,
    required this.firstFieldValue,
    required this.secondFieldValue,
  });
}

class OnRegisterEvent extends RegistrationPasswordEvent {
  final bool buttonActive;
  final bool stateObscure;
  final bool errorState;
  final String firstFieldValue;
  final String secondFieldValue;
  final String userName;
  final String email;

  OnRegisterEvent({
    required this.buttonActive,
    required this.stateObscure,
    required this.errorState,
    required this.firstFieldValue,
    required this.secondFieldValue,
    required this.userName,
    required this.email,
  });
}

class RegistrationEventSucces extends RegistrationPasswordEvent {}

class RegistrationEventError extends RegistrationPasswordEvent {
  final bool buttonActive;
  final bool stateObscure;
  final bool errorState;
  final String firstFieldValue;
  final String secondFieldValue;

  RegistrationEventError({
    required this.buttonActive,
    required this.stateObscure,
    required this.errorState,
    required this.firstFieldValue,
    required this.secondFieldValue,
  });
}

class FieldsErrorEvent extends RegistrationPasswordEvent {
  final bool buttonActive;
  final bool stateObscure;
  final bool errorState;
  final String firstFieldValue;
  final String secondFieldValue;

  FieldsErrorEvent({
    required this.buttonActive,
    required this.stateObscure,
    required this.errorState,
    required this.firstFieldValue,
    required this.secondFieldValue,
  });
}
