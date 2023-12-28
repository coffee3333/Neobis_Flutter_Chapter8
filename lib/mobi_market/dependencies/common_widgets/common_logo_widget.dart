import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/assets_consts.dart';

class CommonLogoWidget extends StatelessWidget {
  const CommonLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsConsts.previewLogo,
        width: 120,
      ),
    );
  }
}
