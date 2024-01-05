import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_empty_info_widget.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return const CustomEmptyInfoWidget();
  }
}
