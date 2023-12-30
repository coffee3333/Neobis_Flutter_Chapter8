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

class _AuthenticationViewState extends State<AuthenticationView> {
  bool errorUserName = false;
  bool errorPassword = false;
  bool butonActive = false;
  bool showPass = true;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
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
              _getUserNameField(),
              const SizedBox(
                height: 32,
              ),
              _getPasswordField(),
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

  Widget _getUserNameField() {
    return CustomTextField(
      controller: usernameController,
      labelText: "Имя пользователя",
      suffixShow: false,
      errorMessage: errorUserName,
      onChanged: _onChangeUserName,
    );
  }

  Widget _getPasswordField() {
    return CustomTextField(
      controller: passwordController,
      labelText: "Пароль",
      suffixShow: true,
      obscure: showPass,
      errorMessage: errorPassword,
      onChanged: _onChangePassword,
      obscureEvent: () {
        setState(() {
          showPass = !showPass;
        });
      },
    );
  }

  Widget _getLogInButton() {
    return BlocListener<AuthenticationBloc, AuthenticationBlocState>(
      listener: (context, state) {
        if (state is AuthenticationSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            RoutesConsts.mainPage,
          );
        } else if (state is AuthenticationErrorState) {
          _buildErrorMessage();
          setState(() {
            butonActive = false;
            errorUserName = true;
            errorPassword = true;
          });
        }
      },
      child: CustomButton(
        active: butonActive,
        label: "Войти",
        onPress: () {
          context.read<AuthenticationBloc>().add(
                AuthenticationEvent(
                  userName: usernameController.text,
                  password: passwordController.text,
                ),
              );
        },
      ),
    );
  }

  Widget _getRegistrationButton() {
    return GestureDetector(
      onTap: () {
        usernameController.clear();
        passwordController.clear();
        _activateButton();
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
        return const CustomDialogWidget(message: "Неверный логин или пароль");
      },
    );
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pop();
      },
    );
  }

  void _activateButton() {
    setState(() {
      butonActive = usernameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  void _onChangeUserName(String value) {
    _activateButton();
    if (errorUserName) {
      setState(() {
        errorUserName = false;
      });
    }
  }

  void _onChangePassword(value) {
    _activateButton();
    if (errorPassword) {
      setState(() {
        errorPassword = false;
      });
    }
  }
}
