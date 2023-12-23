import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/mobi_market/presentation/authentication_page/authentication_bloc/authentication_bloc_bloc.dart';
import 'package:neobis_flutter_chapter8/mobi_market/presentation/authentication_page/authentication_view.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: const AuthenticationView(),
    );
  }
}
