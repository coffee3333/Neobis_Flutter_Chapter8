import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';

class CustomDialogWidget extends StatelessWidget {
  final String titleOkButton;
  final String titleCancelButton;
  final String content;
  final Image image;
  final Function() event;

  const CustomDialogWidget({
    super.key,
    required this.titleOkButton,
    required this.titleCancelButton,
    required this.content,
    required this.image,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        height: 352,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              image,
              const SizedBox(
                height: 24,
              ),
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStylesConsts.dialogContentStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: event,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 11.5),
                  padding: const EdgeInsets.only(top: 14.5, bottom: 14.5),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: ColorsConsts.lv1BlueColor,
                      borderRadius: BorderRadius.all(Radius.circular(19))),
                  child: Text(
                    titleOkButton,
                    style: TextStylesConsts.lvl16ButtonStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 18.5,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  titleCancelButton,
                  style: TextStylesConsts.lvl16BlacBoldkStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
