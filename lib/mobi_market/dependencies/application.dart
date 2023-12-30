import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter8/mobi_market/presentation/authentication_page/authentication_page.dart';
import 'package:neobis_flutter_chapter8/mobi_market/presentation/main_page/main_page.dart';
import 'package:neobis_flutter_chapter8/mobi_market/presentation/preview_page/preview_page.dart';
import 'package:neobis_flutter_chapter8/mobi_market/presentation/registration_pages/registration_login_mail_page/registration_login_mail_page.dart';
import 'package:neobis_flutter_chapter8/mobi_market/presentation/registration_pages/registration_password_page/registration_password_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: ColorsConsts.mainBgColor),
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesConsts.authentication: (context) => const AuthenticationPage(),
        RoutesConsts.registration: (context) =>
            const RegistrationLoginMailPage(),
        RoutesConsts.preview: (context) => const PreviewPage(),
        RoutesConsts.mainPage: (context) => const MainPage(),
        RoutesConsts.registrationPassword: (context) =>
            const RegistrationPasswordPage(),
      },
      initialRoute: RoutesConsts.authentication,
    );
  }
}
