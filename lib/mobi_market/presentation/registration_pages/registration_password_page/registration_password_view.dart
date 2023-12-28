import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_app_bar_widget.dart';
import 'package:neobis_flutter_chapter8/mobi_market/presentation/registration_pages/registration_bloc/registration_bloc.dart';

class RegistrationPasswordView extends StatefulWidget {
  const RegistrationPasswordView({super.key});

  @override
  State<RegistrationPasswordView> createState() =>
      _RegistrationPasswordViewState();
}

class _RegistrationPasswordViewState extends State<RegistrationPasswordView> {
  @override
  Widget build(BuildContext context) {
    // final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;
    return Scaffold(
      body: _getBody(),
      appBar: const CustomAppBar(title: "Регистрация"),
    );
  }

  Widget _getBody() {
    // BlocProvider.of<RegistrationBloc>(context).add(inEvent());

    context.read<RegistrationBloc>().add(inEvent());
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 18, left: 20, right: 20, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
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

  _getLockImage() {
    return BlocBuilder<RegistrationBloc, RegistrationBlocState>(
      builder: (BuildContext context, RegistrationBlocState state) {
        return Text("asdf");
      },
    );
  }
}
