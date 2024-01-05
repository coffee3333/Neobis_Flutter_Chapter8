import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neobis_flutter_chapter8/presentation/liked_page/liked_bloc/liked_bloc.dart';
import 'package:neobis_flutter_chapter8/presentation/liked_page/liked_view.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LikedBloc(),
      child: const LikedView(),
    );
  }
}
