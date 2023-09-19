import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:snkr/presentation/main/main_view_model.dart';
import 'package:snkr/presentation/main/taps/upcoming.dart';

import 'components/main_custom_app_bar.dart';
import 'taps/feed.dart';
import 'taps/instock.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: SafeArea(
          child: MainCustomAppBar(
            onChangeAppBarIndex: (String menu) {
              viewModel.changeAppBarIndex(menu);
            },
            onSearchClick: () {
              //context.go('/search');
              viewModel.changeSearchingStatus();
              context.push('/search');
            },
          ),
        ),
      ),
      body: state.isLoading
          ? switch (state.appBarIndex) {
              0 => Feed(state: state),
              1 => Instock(state: state),
              _ => Upcoming(state: state)
            }
          : const CircularProgressIndicator(),
    );
  }
}
