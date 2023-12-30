import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/text_styles_consts.dart';

class CustomPasswordTextField extends StatelessWidget {
  final bool obscureField;
  final FocusNode focusNode;
  final bool autofocus;
  final bool errorState;
  final Function(String) onChanged;

  const CustomPasswordTextField({
    super.key,
    required this.obscureField,
    required this.focusNode,
    required this.errorState,
    required this.autofocus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: errorState
          ? TextStylesConsts.lv3PasswordRedStyle
          : TextStylesConsts.lv3PasswordBlackStyle,
      onChanged: onChanged,
      focusNode: focusNode,
      obscureText: obscureField,
      autofocus: autofocus,
      obscuringCharacter: '●',
      textAlign: TextAlign.center,
      decoration: const InputDecoration(border: InputBorder.none),
    );
  }
}
