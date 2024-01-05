import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';

class CustomDialogNotificationWidget extends StatelessWidget {
  final bool errorMessage;
  final String message;
  const CustomDialogNotificationWidget(
      {super.key, required this.errorMessage, required this.message});

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
                  color: errorMessage
                      ? ColorsConsts.lv1RedColor
                      : ColorsConsts.lv1GreenColor),
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
