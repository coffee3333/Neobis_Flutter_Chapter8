import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_app_bar_widget.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_button_widget.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_dialog_widget.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_logo_widget.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_text_filed_widget.dart';
import 'package:neobis_flutter_chapter8/mobi_market/presentation/registration_pages/registration_login_mail_page/registration_bloc/registration_bloc.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  bool errorUserName = false;
  bool errorPassword = false;
  bool butonActive = false;
  bool showPass = true;
  final usernameController = TextEditingController();
  final mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      appBar: const CustomAppBar(
        title: "Регистрация",
        action: false,
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
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              _getUserNameField(),
              const SizedBox(
                height: 32,
              ),
              _getMailField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              _getNextButton(),
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

  Widget _getMailField() {
    return CustomTextField(
      controller: mailController,
      labelText: "Почта",
      suffixShow: false,
      errorMessage: errorPassword,
      onChanged: _onChangePassword,
    );
  }

  Widget _getNextButton() {
    return BlocListener<RegistrationBloc, RegistrationBlocState>(
      listener: (context, state) {
        if (state is CheckUserNameAndMailSuccessState) {
          Navigator.pushNamed(context, RoutesConsts.registrationPassword,
              arguments: {
                'username': usernameController.text,
                'email': mailController.text
              });
        } else if (state is CheckUserNameAndMailErrorState) {
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
          context.read<RegistrationBloc>().add(
                MailAndUsernameCheckEvent(
                  userName: usernameController.text,
                  email: mailController.text,
                ),
              );
        },
      ),
    );
  }

  void _buildErrorMessage() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return const CustomDialogWidget(message: "asd");
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
          mailController.text.isNotEmpty &&
          mailController.text.contains("@");
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
