import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_button_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_dialog_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_logo_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_text_filed_widget.dart';
import 'package:neobis_flutter_chapter8/presentation/authentication_page/authentication_bloc/authentication_bloc.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
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

class _AuthenticationViewState extends State<AuthenticationView> {
  final _valueNotifier = ValuesNotifiedModel();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationBlocState>(
      listener: (context, state) {
        if (state is AuthenticationSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            RoutesConsts.mainPage,
          );
        } else if (state is AuthenticationErrorState) {
          _buildErrorMessage();
        }
      },
      child: Scaffold(
        body: _getBody(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CommonLogoWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              _getAuthenticationForm(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              _getLogInButton(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
              ),
              _getRegistrationButton(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAuthenticationForm() {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier.errorState,
      builder: (context, errorState, _) {
        return Column(
          children: [
            _getUserNameField(errorState),
            const SizedBox(
              height: 32,
            ),
            _getPasswordField(errorState),
          ],
        );
      },
    );
  }

  Widget _getUserNameField(bool errorState) {
    return CustomTextField(
      controller: usernameController,
      labelText: "Имя пользователя",
      suffixShow: false,
      errorMessage: errorState,
      onChanged: (value) {
        _updateButtonEvent();
      },
    );
  }

  Widget _getPasswordField(bool errorState) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier.obscureText,
      builder: (context, obscure, _) {
        return CustomTextField(
          controller: passwordController,
          labelText: "Пароль",
          suffixShow: true,
          obscure: obscure,
          errorMessage: errorState,
          onChanged: (value) {
            _updateButtonEvent();
          },
          obscureEvent: () {
            _valueNotifier.obscureText.value =
                !_valueNotifier.obscureText.value;
          },
        );
      },
    );
  }

  Widget _getLogInButton() {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier.buttonActive,
      builder: (context, buttonActive, child) {
        return CustomButton(
          active: buttonActive,
          label: "Войти",
          onPress: () {
            context.read<AuthenticationBloc>().add(
                  AuthenticationEvent(
                    userName: usernameController.text,
                    password: passwordController.text,
                  ),
                );
          },
        );
      },
    );
  }

  Widget _getRegistrationButton() {
    return GestureDetector(
      onTap: () {
        usernameController.clear();
        passwordController.clear();
        Navigator.pushNamed(
          context,
          RoutesConsts.registration,
        );
      },
      child: const Text(
        "Зарегистрироваться",
        style: TextStylesConsts.lvl16BlueStyle,
      ),
    );
  }

  void _buildErrorMessage() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return const CustomDialogWidget(
          errorMessage: true,
          message: "Неверный логин или пароль",
        );
      },
    );
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pop();
        _valueNotifier.errorState.value = true;
        _valueNotifier.buttonActive.value = false;
      },
    );
  }

  void _updateButtonEvent() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      _valueNotifier.buttonActive.value = true;
      _valueNotifier.errorState.value = false;
    } else {
      _valueNotifier.buttonActive.value = false;
      _valueNotifier.errorState.value = false;
    }
  }
}
