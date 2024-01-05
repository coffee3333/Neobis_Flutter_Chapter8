import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';

class CustomAppBarButton extends StatelessWidget {
  final String title;
  final Function() event;
  const CustomAppBarButton(
      {super.key, required this.title, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsConsts.buttonGreyBgColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Text(
            title,
            style: TextStylesConsts.buttonAppBarModuleStyle,
          ),
        ),
      ),
    );
  }
}
