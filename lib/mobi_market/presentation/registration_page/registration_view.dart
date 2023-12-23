import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_button_widget.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_logo_widget.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_text_filed_widget.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

///NOT DONE///

class _RegistrationViewState extends State<RegistrationView> {
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
      appBar: AppBar(
        title: Text("Регистрация"),
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
              _getUserNameField(),
              const SizedBox(
                height: 32,
              ),
              _getPasswordField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              _getNextButton(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
              ),
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
      labelText: "Почта",
      suffixShow: false,
      errorMessage: errorPassword,
      onChanged: _onChangePassword,
    );
  }

  Widget _getNextButton() {
    return CustomButton(
      active: butonActive,
      label: "Войти",
      onPress: () {},
    );
  }

  void _buildErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.red),
          child: const Center(
            child: Text(
              "Неверный логин или пароль",
              style: TextStylesConsts.lvl16WhiteStyle,
            ),
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // behavior: SnackBarBehavior.floating,
      ),
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
