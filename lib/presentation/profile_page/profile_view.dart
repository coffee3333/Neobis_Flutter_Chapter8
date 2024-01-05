import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_app_bar_button.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_app_bar_module_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_dialog_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConsts.lv1GreyBgColor,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return CustomAppBarModule(
      title: 'Профиль',
      actionWidget: [
        CustomAppBarButton(
          title: "Изм.",
          event: () {},
        )
      ],
      leadingWidget: null,
    );
  }

  Widget _getBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getUserInfo(),
          const SizedBox(
            height: 24,
          ),
          _getLinkLiked(),
          _getSeparator(),
          _getLinkMyItems(),
          const SizedBox(
            height: 16,
          ),
          _getLinkLogOut(),
          const Spacer(),
          _getButtonRegistrationEnd()
        ],
      ),
    );
  }

  Widget _getUserInfo() {
    return Center(
      child: Column(
        children: [
          Image.asset(AssetsConsts.userImage),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Алеся",
            style: TextStylesConsts.lvl18Gray2Style,
          ),
        ],
      ),
    );
  }

  Widget _getLinkLiked() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RoutesConsts.profileLiked),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 26),
          child: Row(
            children: [
              SvgPicture.asset(AssetsConsts.likedItemsIcon),
              const SizedBox(
                width: 9,
              ),
              const Text(
                "Понравившиеся",
                style: TextStylesConsts.lvl26BlackStyle,
              ),
              const Spacer(),
              SvgPicture.asset(AssetsConsts.linkArrowIcon)
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLinkMyItems() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RoutesConsts.profileMyItems),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 26),
          child: Row(
            children: [
              SvgPicture.asset(AssetsConsts.myItemsIcon),
              const SizedBox(
                width: 9,
              ),
              const Text(
                "Мои товары",
                style: TextStylesConsts.lvl26BlackStyle,
              ),
              const Spacer(),
              SvgPicture.asset(AssetsConsts.linkArrowIcon)
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLinkLogOut() {
    return GestureDetector(
      onTap: () => _showLogOutDialog(),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 16, left: 16, right: 26, top: 16),
          child: Row(
            children: [
              SvgPicture.asset(AssetsConsts.logoutIcon),
              const SizedBox(
                width: 9,
              ),
              const Text(
                "Выйти",
                style: TextStylesConsts.lvl26BlackStyle,
              ),
              const Spacer(),
              SvgPicture.asset(AssetsConsts.linkArrowIcon)
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSeparator() {
    return Container(
      width: 264,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: ColorsConsts.lv1GreyBgColor, width: 1),
        ),
      ),
    );
  }

  Widget _getButtonRegistrationEnd() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 44,
        decoration: const BoxDecoration(
          color: ColorsConsts.lv1BlueColor,
          borderRadius: BorderRadius.all(
            Radius.circular(80),
          ),
        ),
        child: const Text(
          "Закончить регистрацию",
          textAlign: TextAlign.center,
          style: TextStylesConsts.lvl16ButtonStyle,
        ),
      ),
    );
  }

  void _showLogOutDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return CustomDialogWidget(
          image: Image.asset(AssetsConsts.logoutImage),
          titleOkButton: "Выйти",
          titleCancelButton: "Отмена",
          content: "Вы действительно хотите выйти с приложения?",
          event: () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesConsts.authentication, (route) => false),
        );
      },
    );
  }
}
