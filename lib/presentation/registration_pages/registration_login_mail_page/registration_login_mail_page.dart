import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/presentation/registration_pages/registration_login_mail_page/cubit/registration_login_mail_cubit.dart';
import 'package:neobis_flutter_chapter8/presentation/registration_pages/registration_login_mail_page/registration_login_mail_view.dart';

class RegistrationLoginMailPage extends StatelessWidget {
  const RegistrationLoginMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationLoginMailCubit(),
      child: const RegistrationView(),
    );
  }
}
