import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/text_styles_consts.dart';

class CustomButton extends StatelessWidget {
  final bool active;
  final String label;
  final Function() onPress;

  const CustomButton({
    super.key,
    required this.active,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              active ? ColorsConsts.lv1BlueColor : ColorsConsts.mainGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ),
        onPressed: active ? onPress : () {},
        child: Text(
          label,
          style: TextStylesConsts.lvl16ButtonStyle,
        ),
      ),
    );
  }
}
