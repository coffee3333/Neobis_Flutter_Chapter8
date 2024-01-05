import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';

class CustomAppBarModule extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionWidget;
  final Widget? leadingWidget;

  const CustomAppBarModule({
    super.key,
    required this.title,
    required this.actionWidget,
    required this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: AppBar(
        title: Text(title),
        leading: leadingWidget,
        actions: actionWidget,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: ColorsConsts.lv1GreyBgColor,
        titleTextStyle: TextStylesConsts.headerAppBarStyle,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
