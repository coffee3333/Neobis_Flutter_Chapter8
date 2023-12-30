import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool suffixShow;
  final bool? obscure;
  final Function()? obscureEvent;
  final bool errorMessage;
  final Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.suffixShow,
    this.obscure,
    this.obscureEvent,
    required this.errorMessage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: errorMessage
            ? TextStylesConsts.lvl16RedStyle
            : TextStylesConsts.lvl16BlackStyle,
        obscureText: obscure ?? false,
        decoration: _getCustomInputDecorator(
          labelText,
          _getIconButton(suffixShow),
        ),
      ),
    );
  }

  InputDecoration _getCustomInputDecorator(
    String labelText,
    Widget? iconButton,
  ) {
    return InputDecoration(
      label: Text(
        labelText,
        style: TextStylesConsts.lvl16GrayStyle,
      ),
      enabledBorder: _getBorder(),
      focusedBorder: _getBorder(),
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      suffixIcon: iconButton,
    );
  }

  UnderlineInputBorder _getBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: !errorMessage
            ? ColorsConsts.mainGreyColor
            : ColorsConsts.lv1RedColor,
        width: 0.5,
      ),
    );
  }

  Widget _getIconButton(bool suffixShow) {
    if (suffixShow) {
      return IconButton(
        onPressed: () {
          obscureEvent!();
        },
        icon: obscure!
            ? SvgPicture.asset(
                AssetsConsts.textFieldObscure,
              )
            : SvgPicture.asset(
                AssetsConsts.textFieldNotObscure,
              ),
      );
    }
    return const SizedBox();
  }
}
