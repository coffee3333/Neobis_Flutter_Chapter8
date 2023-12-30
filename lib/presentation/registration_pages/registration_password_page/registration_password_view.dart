import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_app_bar_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_button_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_text_field_password_widget.dart';
import 'package:neobis_flutter_chapter8/presentation/registration_pages/registration_password_page/registration_password_bloc/registration_password_bloc.dart';

class RegistrationPasswordView extends StatefulWidget {
  const RegistrationPasswordView({super.key});

  @override
  State<RegistrationPasswordView> createState() =>
      _RegistrationPasswordViewState();
}

class _RegistrationPasswordViewState extends State<RegistrationPasswordView> {
  final FocusNode _focusFirstPassword = FocusNode();
  final FocusNode _focusSecondPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      appBar: _getAppBar(),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: BlocBuilder<RegistrationPasswordBloc, RegistrationPasswordState>(
        builder: (context, state) {
          return CustomAppBar(
            title: "Регистрация",
            action: true,
            obscure: state.obscureState,
            obscureEvent: () {
              context.read<RegistrationPasswordBloc>().add(
                    ObscureFieldsEvent(
                      buttonActive: state.buttonActive,
                      stateObscure: !state.obscureState,
                      errorState: state.errorState,
                      firstFieldValue: state.firstFieldValue,
                      secondFieldValue: state.secondFieldValue,
                    ),
                  );
            },
          );
        },
      ),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 18, left: 20, right: 20, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _getLockLogo(),
              const SizedBox(
                height: 28,
              ),
              _getText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              _getFirstPasswordField(),
              const SizedBox(
                height: 5,
              ),
              _getSecondPasswordField(),
              const SizedBox(
                height: 10,
              ),
              _getErrorMessage(),
              const SizedBox(
                height: 10,
              ),
              _getNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLockLogo() {
    return Center(
      child: Image.asset(AssetsConsts.lockImg),
    );
  }

  Column _getText() {
    return const Column(
      children: [
        Text(
          "Придумайте пароль",
          style: TextStylesConsts.lv2headerStyle,
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 360,
          child: Text(
            "Минимальная длина — 8 символов. Для надежности пароль должен содержать буквы и цифры.",
            style: TextStylesConsts.lvl16GrayStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _getFirstPasswordField() {
    return BlocBuilder<RegistrationPasswordBloc, RegistrationPasswordState>(
      builder: (context, state) {
        return CustomPasswordTextField(
          obscureField: state.obscureState,
          focusNode: _focusFirstPassword,
          errorState: state.errorState,
          autofocus: true,
          onChanged: (value) {
            context
                .read<RegistrationPasswordBloc>()
                .add(OnChangeFirstFieldEvent(
                  buttonActive: state.buttonActive,
                  firstFieldValue: value,
                  stateObscure: state.obscureState,
                  errorState: state.errorState,
                  secondFieldValue: state.secondFieldValue,
                ));
          },
        );
      },
    );
  }

  Widget _getSecondPasswordField() {
    return BlocBuilder<RegistrationPasswordBloc, RegistrationPasswordState>(
      builder: (context, state) {
        return CustomPasswordTextField(
          obscureField: state.obscureState,
          focusNode: _focusSecondPassword,
          errorState: state.errorState,
          autofocus: false,
          onChanged: (value) {
            context.read<RegistrationPasswordBloc>().add(
                  OnChangeSecondFieldEvent(
                    buttonActive: state.buttonActive,
                    secondFieldValue: value,
                    stateObscure: state.obscureState,
                    errorState: state.errorState,
                    firstFieldValue: state.firstFieldValue,
                  ),
                );
          },
        );
      },
    );
  }

  Widget _getNextButton() {
    return BlocConsumer<RegistrationPasswordBloc, RegistrationPasswordState>(
      builder: (context, state) {
        return CustomButton(
          active: state.buttonActive,
          label: "Далее",
          onPress: () {
            _onPressButton(state);
          },
        );
      },
      listener: (context, state) {
        if (state is OnButtonEvent) {}
      },
    );
  }

  void _onPressButton(RegistrationPasswordState state) {
    if (_focusFirstPassword.hasFocus) {
      FocusScope.of(context).requestFocus(_focusSecondPassword);
      context.read<RegistrationPasswordBloc>().add(
            OnButtonEvent(
              buttonActive: state.buttonActive,
              firstFieldValue: state.firstFieldValue,
              stateObscure: state.obscureState,
              errorState: state.errorState,
              secondFieldValue: state.secondFieldValue,
            ),
          );
    } else if (_focusSecondPassword.hasFocus &&
        (state.firstFieldValue == state.secondFieldValue)) {
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;
      context.read<RegistrationPasswordBloc>().add(
            OnRegisterEvent(
              buttonActive: state.buttonActive,
              firstFieldValue: state.firstFieldValue,
              secondFieldValue: state.secondFieldValue,
              stateObscure: state.obscureState,
              errorState: state.errorState,
              userName: arguments['username'],
              email: arguments['email'],
            ),
          );
    } else {
      context.read<RegistrationPasswordBloc>().add(
            FieldsErrorEvent(
              buttonActive: state.buttonActive,
              firstFieldValue: state.firstFieldValue,
              stateObscure: state.obscureState,
              errorState: state.errorState,
              secondFieldValue: state.secondFieldValue,
            ),
          );
    }
  }

  Widget _getErrorMessage() {
    return BlocBuilder<RegistrationPasswordBloc, RegistrationPasswordState>(
      builder: (context, state) {
        if (state.errorState) {
          return const Text(
            "Пароли не совпадают",
            style: TextStylesConsts.lvl16RedStyle,
          );
        }
        return const SizedBox();
      },
    );
  }
}
