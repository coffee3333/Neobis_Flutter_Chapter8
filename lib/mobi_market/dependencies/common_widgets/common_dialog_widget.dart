import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/text_styles_consts.dart';

class CustomDialogWidget extends StatelessWidget {
  final String message;
  const CustomDialogWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ColorsConsts.lv1RedColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetsConsts.warningIcon),
                  const SizedBox(
                    width: 2.5,
                  ),
                  Center(
                    child: Text(
                      message,
                      style: TextStylesConsts.lvl16WhiteStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
