import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_app_bar_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_button_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_dialog_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_logo_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_text_filed_widget.dart';
import 'package:neobis_flutter_chapter8/presentation/registration_pages/registration_login_mail_page/cubit/registration_login_mail_cubit.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final buttonActive = ValueNotifier<bool>(false);
  final usernameController = TextEditingController();
  final mailController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    mailController.dispose();
    buttonActive.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationLoginMailCubit, RegistrationLoginMailState>(
      listener: (context, state) {
        if (state is CheckUserSuccessState) {
          Navigator.pushNamed(context, RoutesConsts.registrationPassword,
              arguments: {
                'username': usernameController.text,
                'email': mailController.text
              });
        } else if (state is CheckUserErrorState) {
          _buildErrorMessage(state.errorText);
        }
      },
      child: Scaffold(
        body: _getBody(),
        appBar: const CustomAppBar(
          title: "Регистрация",
          action: false,
        ),
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
      errorMessage: false,
      onChanged: (value) {
        _updateButton();
      },
    );
  }

  Widget _getMailField() {
    return CustomTextField(
      controller: mailController,
      labelText: "Почта",
      suffixShow: false,
      errorMessage: false,
      onChanged: (value) {
        _updateButton();
      },
    );
  }

  Widget _getNextButton() {
    return ValueListenableBuilder(
      valueListenable: buttonActive,
      builder: (context, activeButton, _) {
        return CustomButton(
          active: activeButton,
          label: "Войти",
          onPress: () {
            context.read<RegistrationLoginMailCubit>().checkUser(
                  username: usernameController.text,
                  email: mailController.text,
                );
          },
        );
      },
    );
  }

  void _updateButton() {
    if (usernameController.text.isNotEmpty &&
        mailController.text.isNotEmpty &&
        mailController.text.contains("@")) {
      buttonActive.value = true;
      return;
    }
    buttonActive.value = false;
  }

  void _buildErrorMessage(String message) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return CustomDialogWidget(errorMessage: true, message: message);
      },
    );
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pop();
      },
    );
  }
}
