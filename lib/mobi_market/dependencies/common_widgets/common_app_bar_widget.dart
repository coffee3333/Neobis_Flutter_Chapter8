import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/mobi_market/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/common_widgets/common_back_button_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: AppBar(
        title: Text(title),
        leading: const CustomBackButton(),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStylesConsts.headerAppBarStyle,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
