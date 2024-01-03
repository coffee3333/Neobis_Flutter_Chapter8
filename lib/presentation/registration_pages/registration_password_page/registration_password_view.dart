import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_app_bar_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_button_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_dialog_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_text_field_password_widget.dart';
import 'package:neobis_flutter_chapter8/presentation/registration_pages/registration_password_page/cubit/registration_password_cubit.dart';

class RegistrationPasswordView extends StatefulWidget {
  const RegistrationPasswordView({super.key});

  @override
  State<RegistrationPasswordView> createState() =>
      _RegistrationPasswordViewState();
}

class ValuesNotifiedModel {
  final obscureText = ValueNotifier<bool>(false);
  final buttonActive = ValueNotifier<bool>(false);
  final errorState = ValueNotifier<bool>(false);

  void dispose() {
    obscureText.dispose();
    buttonActive.dispose();
    errorState.dispose();
  }
}

class _RegistrationPasswordViewState extends State<RegistrationPasswordView> {
  final _valueNotifier = ValuesNotifiedModel();
  final firstPasswordController = TextEditingController();
  final secondPasswordController = TextEditingController();
  final _focusFirstPassword = FocusNode();
  final _focusSecondPassword = FocusNode();

  @override
  void dispose() {
    firstPasswordController.dispose();
    secondPasswordController.dispose();
    _focusFirstPassword.dispose();
    _focusSecondPassword.dispose();
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationPasswordCubit, RegistrationPasswordState>(
      listener: (context, state) {
        if (state is RegistrationUserSuccess) {
          _buildMessage("Вы зарегестрированны", false);
        } else if (state is RegistrationUserError) {
          _buildMessage(state.errorText, true);
        }
      },
      child: Scaffold(
        body: _getBody(),
        appBar: _getAppBar(),
      ),
    );
  }

  PreferredSize _getAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: ValueListenableBuilder(
        valueListenable: _valueNotifier.obscureText,
        builder: (context, obscure, _) {
          return CustomAppBar(
            title: "Регистрация",
            action: true,
            obscure: obscure,
            obscureEvent: () {
              _valueNotifier.obscureText.value =
                  !_valueNotifier.obscureText.value;
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
              _getPasswordForm(),
              const SizedBox(
                height: 10,
              ),
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

  Widget _getPasswordForm() {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier.errorState,
      builder: (context, errorState, _) {
        return Column(
          children: [
            _getFirstPasswordField(errorState),
            const SizedBox(
              height: 10,
            ),
            _getSecondPasswordField(errorState),
            const SizedBox(
              height: 10,
            ),
            _getErrorMessage(errorState),
            const SizedBox(
              height: 10,
            ),
            _getNextButton(),
          ],
        );
      },
    );
  }

  Widget _getFirstPasswordField(bool errorState) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier.obscureText,
      builder: (context, obscureText, _) {
        return CustomPasswordTextField(
          controller: firstPasswordController,
          obscureField: !obscureText,
          focusNode: _focusFirstPassword,
          errorState: errorState,
          autofocus: true,
          onChanged: (value) {
            if (value.contains(RegExp(r'[a-zA-Z]')) &&
                value.contains(RegExp(r'[0-9]'))) {
              _valueNotifier.buttonActive.value = true;
              _valueNotifier.errorState.value = false;
            } else {
              _valueNotifier.buttonActive.value = false;
              _valueNotifier.errorState.value = false;
            }
          },
        );
      },
    );
  }

  Widget _getSecondPasswordField(bool errorState) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier.obscureText,
      builder: (context, obscureText, _) {
        return CustomPasswordTextField(
          controller: secondPasswordController,
          obscureField: !obscureText,
          focusNode: _focusSecondPassword,
          errorState: errorState,
          autofocus: false,
          onChanged: (value) {
            if (firstPasswordController.text == secondPasswordController.text) {
              _valueNotifier.buttonActive.value = true;
              _valueNotifier.errorState.value = false;
            } else {
              _valueNotifier.buttonActive.value = false;
              _valueNotifier.errorState.value = true;
            }
          },
        );
      },
    );
  }

  Widget _getNextButton() {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier.buttonActive,
      builder: (context, activeButton, _) {
        return CustomButton(
          active: activeButton,
          label: "Далее",
          onPress: () {
            _onPressEvent();
          },
        );
      },
    );
  }

  Widget _getErrorMessage(bool errorState) {
    if (errorState) {
      return const Text(
        "Пароли не совпадают",
        style: TextStylesConsts.lvl16RedStyle,
      );
    }
    return const SizedBox();
  }

  void _onPressEvent() {
    if (_focusFirstPassword.hasFocus) {
      FocusScope.of(context).requestFocus(_focusSecondPassword);
      _valueNotifier.buttonActive.value = false;
      return;
    } else if (_focusSecondPassword.hasFocus &&
        (firstPasswordController.text == secondPasswordController.text)) {
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;
      context.read<RegistrationPasswordCubit>().registerUser(
            email: arguments['email'],
            username: arguments['username'],
            password: firstPasswordController.text,
          );
      return;
    }
    _valueNotifier.buttonActive.value = false;
    _valueNotifier.errorState.value = true;
  }

  void _buildMessage(String message, bool errorMessage) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return CustomDialogWidget(errorMessage: errorMessage, message: message);
      },
    );
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (errorMessage) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      },
    );
  }
}
