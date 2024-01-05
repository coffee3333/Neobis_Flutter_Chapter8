import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_empty_info_widget.dart';

mixin GridViewWidgets {
  Widget getCircularProgressIndicator() {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }

  Widget getEmptyInfoWidget() {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              CustomEmptyInfoWidget(),
            ],
          ),
        )
      ],
    );
  }
}
