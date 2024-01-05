import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/presentation/home_page/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
    // return BlocProvider(
    //   create: (context) => MainBloc(),
    //   child: const MainView(),
    // );
  }
}
