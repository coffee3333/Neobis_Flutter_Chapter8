import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/presentation/registration_pages/registration_password_page/cubit/registration_password_cubit.dart';
import 'package:neobis_flutter_chapter8/presentation/registration_pages/registration_password_page/registration_password_view.dart';

class RegistrationPasswordPage extends StatelessWidget {
  const RegistrationPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationPasswordCubit(),
      child: const RegistrationPasswordView(),
    );
  }
}
