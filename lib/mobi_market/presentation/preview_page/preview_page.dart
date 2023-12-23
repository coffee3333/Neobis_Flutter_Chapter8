import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/routes_consts.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesConsts.authentication);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double verticalPadding = screenHeight * 0.2;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: verticalPadding),
        child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            AssetsConsts.previewLogo,
          ),
        ),
      ),
    );
  }
}
