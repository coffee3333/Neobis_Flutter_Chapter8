import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_empty_info_widget.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return const CustomEmptyInfoWidget();
  }
}
