import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter8/presentation/authentication_page/authentication_page.dart';
import 'package:neobis_flutter_chapter8/presentation/home_page/home_page.dart';
import 'package:neobis_flutter_chapter8/presentation/liked_page/liked_page.dart';
import 'package:neobis_flutter_chapter8/presentation/my_items_page/my_items_page.dart';
import 'package:neobis_flutter_chapter8/presentation/preview_page/preview_page.dart';
import 'package:neobis_flutter_chapter8/presentation/registration_pages/registration_login_mail_page/registration_login_mail_page.dart';
import 'package:neobis_flutter_chapter8/presentation/registration_pages/registration_password_page/registration_password_page.dart';

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
        RoutesConsts.homePage: (context) => const HomePage(),
        RoutesConsts.registrationPassword: (context) =>
            const RegistrationPasswordPage(),
        RoutesConsts.profileLiked: (context) => const LikedPage(),
        RoutesConsts.profileMyItems: (context) => const MyItemsPage(),
      },
      initialRoute: RoutesConsts.authentication,
    );
  }
}
