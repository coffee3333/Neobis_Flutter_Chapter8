import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';

class CustomEmptyInfoWidget extends StatelessWidget {
  const CustomEmptyInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsConsts.emptyBoxImage),
          const SizedBox(
            height: 44,
          ),
          const Text(
            "Ой пусто!",
            style: TextStylesConsts.lvl18GrayStyle,
          )
        ],
      ),
    );
  }
}
