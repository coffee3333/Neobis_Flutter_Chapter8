import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_app_bar_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_dialog_widget.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_grid_view_widgets.dart';
import 'package:neobis_flutter_chapter8/dependencies/common_widgets/common_item_widget.dart';
import 'package:neobis_flutter_chapter8/presentation/liked_page/liked_bloc/liked_bloc.dart';

class LikedView extends StatefulWidget {
  const LikedView({super.key});

  @override
  State<LikedView> createState() => _LikedViewState();
}

class _LikedViewState extends State<LikedView> with GridViewWidgets {
  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

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
            return _buildItems(state);
          } else if (state is LikedBlocLoading) {
            return getCircularProgressIndicator();
          }
          return getEmptyInfoWidget();
        },
      ),
    );
  }

  Widget _buildItems(UpdatedState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 2 / 2.3,
          crossAxisSpacing: 13,
          mainAxisSpacing: 12,
        ),
        itemCount: state.data.length,
        itemBuilder: (context, index) {
          return CustomItemWidget(
            id: state.data[index]["product_id"],
            index: index,
            title: state.data[index]["productName"],
            price: state.data[index]["price"],
            likes: 100,
            liked: true,
            onDetailEvent: (id) => onDetailEvent(id),
            onLikeEvent: (id) => onLikeEvent(id),
          );
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    context.read<LikedBloc>().add(UpdateEvent());
  }

  void onDetailEvent(int id) {
    Navigator.pushNamed(context, RoutesConsts.profileLikedDetail,
        arguments: id);
  }

  void onLikeEvent(int id) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return CustomDialogWidget(
          image: Image.asset(AssetsConsts.likeDialogImage),
          titleOkButton: "Удалить",
          titleCancelButton: "Отмена",
          content: "Вы действительно хотите удалить из понравившихся",
          event: () => onDeleteEvent(id),
        );
      },
    );
  }

  void onDeleteEvent(id) {
    context.read<LikedBloc>().add(DislikeEvent(id: id));
  }
}
