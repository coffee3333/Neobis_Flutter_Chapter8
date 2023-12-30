import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: SvgPicture.asset(
        AssetsConsts.backButtonIcon,
        height: 28,
        width: 44,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
