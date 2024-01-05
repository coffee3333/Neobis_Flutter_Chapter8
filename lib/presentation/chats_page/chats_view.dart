import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_empty_info_widget.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  @override
  Widget build(BuildContext context) {
    return const CustomEmptyInfoWidget();
  }
}
