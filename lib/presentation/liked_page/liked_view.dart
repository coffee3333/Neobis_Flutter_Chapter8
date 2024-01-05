import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_app_bar_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_empty_info_widget.dart';
import 'package:neobis_flutter_chapter8/presentation/liked_page/liked_bloc/liked_bloc.dart';

class LikedView extends StatefulWidget {
  const LikedView({super.key});

  @override
  State<LikedView> createState() => _LikedViewState();
}

class _LikedViewState extends State<LikedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return const CustomAppBar(title: "Понравившиеся", action: false);
  }

  Widget _getBody() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: BlocBuilder<LikedBloc, LikedBlocState>(
        builder: (context, state) {
          if (state is UpdatedState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 2 / 2.3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  child: Text("$index"),
                );
              },
            );
          } else if (state is LikedBlocLoading) {
            return CircularProgressIndicator();
          }
          return const CustomEmptyInfoWidget();
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    context.read<LikedBloc>().add(UpdateEvent());
  }
}
