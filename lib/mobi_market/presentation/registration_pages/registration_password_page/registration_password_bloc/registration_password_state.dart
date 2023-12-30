part of 'registration_password_bloc.dart';

@immutable
sealed class RegistrationPasswordState {
  final bool buttonActive;
  final bool obscureState;
  final bool errorState;
  final String firstFieldValue;
  final String secondFieldValue;

  RegistrationPasswordState({
    required this.buttonActive,
    required this.obscureState,
    required this.errorState,
    required this.firstFieldValue,
    required this.secondFieldValue,
  });
}

class RegistrationPasswordInitial extends RegistrationPasswordState {
  RegistrationPasswordInitial()
      : super(
          buttonActive: false,
          obscureState: true,
          errorState: false,
          firstFieldValue: "",
          secondFieldValue: "",
        );
}

class ObscureFieldsState extends RegistrationPasswordState {
  @override
  ObscureFieldsState({
    required bool buttonActive,
    required bool obscureState,
    required bool errorState,
    required String firstFieldValue,
    required String secondFieldValue,
  }) : super(
          buttonActive: buttonActive,
          obscureState: obscureState,
          errorState: errorState,
          firstFieldValue: firstFieldValue,
          secondFieldValue: secondFieldValue,
        );
}

class OnChangeFirstFieldState extends RegistrationPasswordState {
  @override
  OnChangeFirstFieldState({
    required bool buttonActive,
    required bool obscureState,
    required bool errorState,
    required String firstFieldValue,
    required String secondFieldValue,
  }) : super(
          buttonActive: buttonActive,
          obscureState: obscureState,
          errorState: errorState,
          firstFieldValue: firstFieldValue,
          secondFieldValue: secondFieldValue,
        );
}

class OnChangeSecondFieldState extends RegistrationPasswordState {
  @override
  OnChangeSecondFieldState({
    required bool buttonActive,
    required bool obscureState,
    required bool errorState,
    required String firstFieldValue,
    required String secondFieldValue,
  }) : super(
          buttonActive: buttonActive,
          obscureState: obscureState,
          errorState: errorState,
          firstFieldValue: firstFieldValue,
          secondFieldValue: secondFieldValue,
        );
}

class NextStepState extends RegistrationPasswordState {
  @override
  NextStepState({
    required bool buttonActive,
    required bool obscureState,
    required bool errorState,
    required String firstFieldValue,
    required String secondFieldValue,
  }) : super(
          buttonActive: buttonActive,
          obscureState: obscureState,
          errorState: errorState,
          firstFieldValue: firstFieldValue,
          secondFieldValue: secondFieldValue,
        );
}

class FieldsErrorState extends RegistrationPasswordState {
  @override
  FieldsErrorState({
    required bool buttonActive,
    required bool obscureState,
    required bool errorState,
    required String firstFieldValue,
    required String secondFieldValue,
  }) : super(
          buttonActive: buttonActive,
          obscureState: obscureState,
          errorState: errorState,
          firstFieldValue: firstFieldValue,
          secondFieldValue: secondFieldValue,
        );
}
