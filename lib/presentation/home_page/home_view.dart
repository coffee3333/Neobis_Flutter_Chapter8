import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter8/presentation/chats_page/chats_page.dart';
import 'package:neobis_flutter_chapter8/presentation/main_page/main_page.dart';
import 'package:neobis_flutter_chapter8/presentation/profile_page/profile_page.dart';
import 'package:neobis_flutter_chapter8/presentation/wallet_page/wallet_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _selectedIndex = ValueNotifier<int>(0);
  static const List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    WalletPage(),
    ChatsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (context, screenIndex, _) {
        return Scaffold(
          backgroundColor: ColorsConsts.lv1GreyBgColor,
          body: _getBody(screenIndex),
          bottomNavigationBar: _getNavigationBar(),
          floatingActionButton: _getButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  Widget _getBody(int currentScreen) {
    return Container(
      color: ColorsConsts.lv1GreyBgColor,
      child: Center(
        child: _widgetOptions.elementAt(currentScreen),
      ),
    );
  }

  Widget _getButton() {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: ColorsConsts.lv1BlueColor),
        child: SvgPicture.asset(
          AssetsConsts.plusNavBar,
        ),
      ),
    );
  }

  Widget _getNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2),
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 13.5),
                child: SvgPicture.asset(
                  AssetsConsts.mainNavBarIcon,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex.value == 0
                        ? ColorsConsts.lv1BlueColor
                        : ColorsConsts.lv2GreyBgColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 13.5),
                child: SvgPicture.asset(
                  AssetsConsts.walletNavBarIcon,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex.value == 1
                        ? ColorsConsts.lv1BlueColor
                        : ColorsConsts.lv2GreyBgColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Кошелек',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 13.5),
                child: SvgPicture.asset(
                  AssetsConsts.chatNavBar,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex.value == 2
                        ? ColorsConsts.lv1BlueColor
                        : ColorsConsts.lv2GreyBgColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Чаты',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 13.5),
                child: SvgPicture.asset(
                  AssetsConsts.userNavBar,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex.value == 3
                        ? ColorsConsts.lv1BlueColor
                        : ColorsConsts.lv2GreyBgColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Профиль',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          elevation: 12,
          currentIndex: _selectedIndex.value,
          selectedItemColor: ColorsConsts.lv1BlueColor,
          unselectedItemColor: ColorsConsts.lv2GreyBgColor,
          selectedLabelStyle: TextStylesConsts.navBarStyle,
          unselectedLabelStyle: TextStylesConsts.navBarStyle,
          backgroundColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
