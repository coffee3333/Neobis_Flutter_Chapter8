import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/container/di_container.dart';
import 'package:neobis_flutter_chapter8/mobi_market/domain/models/registeration/registration_model.dart';
import 'package:neobis_flutter_chapter8/mobi_market/domain/use_cases/registration/registration_use_case.dart';

part 'registration_password_event.dart';
part 'registration_password_state.dart';

class RegistrationPasswordBloc
    extends Bloc<RegistrationPasswordEvent, RegistrationPasswordState> {
  RegistrationPasswordBloc() : super(RegistrationPasswordInitial()) {
    on<ObscureFieldsEvent>(_obscureField);
    on<OnChangeFirstFieldEvent>(_onChangeFirstFieldEvent);
    on<OnChangeSecondFieldEvent>(_onChangeSecondFieldEvent);
    on<OnButtonEvent>(_onButtonEvent);
    on<OnRegisterEvent>(_onRegisterEvent);
    on<FieldsErrorEvent>(_onFieldsErrorEvent);
  }

  late RegisterModel _registrationModel;
  final _registrationUseCase = getIt.get<RegistrationUseCase>();

  void _obscureField(
      ObscureFieldsEvent event, Emitter<RegistrationPasswordState> emit) async {
    emit(
      ObscureFieldsState(
        buttonActive: event.buttonActive,
        obscureState: event.stateObscure,
        errorState: event.errorState,
        firstFieldValue: event.firstFieldValue,
        secondFieldValue: state.secondFieldValue,
      ),
    );
  }

  void _onChangeFirstFieldEvent(OnChangeFirstFieldEvent event,
      Emitter<RegistrationPasswordState> emit) async {
    if (event.firstFieldValue.contains(RegExp(r'[a-zA-Z]')) &&
        event.firstFieldValue.contains(RegExp(r'[0-9]'))) {
      emit(
        OnChangeFirstFieldState(
          buttonActive: true,
          firstFieldValue: event.firstFieldValue,
          obscureState: event.stateObscure,
          errorState: false,
          secondFieldValue: event.secondFieldValue,
        ),
      );
    }
  }

  void _onChangeSecondFieldEvent(OnChangeSecondFieldEvent event,
      Emitter<RegistrationPasswordState> emit) async {
    emit(
      OnChangeSecondFieldState(
        buttonActive: true,
        firstFieldValue: event.firstFieldValue,
        obscureState: event.stateObscure,
        errorState: false,
        secondFieldValue: event.secondFieldValue,
      ),
    );
  }

  void _onButtonEvent(
      OnButtonEvent event, Emitter<RegistrationPasswordState> emit) async {
    emit(
      NextStepState(
        buttonActive:
            event.firstFieldValue == event.secondFieldValue ? true : false,
        firstFieldValue: event.firstFieldValue,
        obscureState: event.stateObscure,
        errorState: event.errorState,
        secondFieldValue: event.secondFieldValue,
      ),
    );
  }

  void _onRegisterEvent(
      OnRegisterEvent event, Emitter<RegistrationPasswordState> emit) async {
    final registrationModel = RegisterModel(
        email: event.email,
        username: event.userName,
        password: event.firstFieldValue);
    try {
      await _registrationUseCase.call(registrationModel);
      print("go");
      // emit(CheckUserNameAndMailSuccessState());
    } catch (e) {
      print(e);
      // emit(CheckUserNameAndMailErrorState(errorText: "error"));
    }
  }

  void _onFieldsErrorEvent(
      FieldsErrorEvent event, Emitter<RegistrationPasswordState> emit) {
    emit(FieldsErrorState(
      buttonActive: event.buttonActive,
      firstFieldValue: event.firstFieldValue,
      obscureState: event.stateObscure,
      errorState: true,
      secondFieldValue: event.secondFieldValue,
    ));
  }
}
