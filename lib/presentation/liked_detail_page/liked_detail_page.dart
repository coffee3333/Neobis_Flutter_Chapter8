import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter8/presentation/liked_detail_page/liked_detail_cubit/liked_detail_cubit.dart';
import 'package:neobis_flutter_chapter8/presentation/liked_detail_page/liked_detail_view.dart';

class LikedDetailPage extends StatelessWidget {
  const LikedDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LikedDetailCubit(),
      child: const LikedDetailView(),
    );
  }
}
