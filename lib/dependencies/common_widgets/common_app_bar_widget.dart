import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_back_button_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool action;
  final bool? obscure;
  final Function()? obscureEvent;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.action,
    this.obscure,
    this.obscureEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: AppBar(
        title: Text(title),
        leading: const CustomBackButton(),
        actions: _getActionSide(),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStylesConsts.headerAppBarStyle,
      ),
    );
  }

  _getActionSide() {
    if (action && obscure != null) {
      return [
        IconButton(
          onPressed: () => obscureEvent!(),
          icon: Icon(
            obscure! ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ];
    }
    return null;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
