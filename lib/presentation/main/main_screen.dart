import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:snkr/presentation/main/main_view_model.dart';
import 'package:snkr/presentation/main/taps/upcoming.dart';

import 'components/custom_app_bar.dart';
import 'taps/feed.dart';
import 'taps/instock.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: SafeArea(
          child: CustomAppBar(
            viewModel: viewModel,
          ),
        ),
      ),
      body: state.isLoading
          ? switch (state.appBarIndex) {
              0 => Feed(state: state),
              1 => Instock(state: state),
              _ => Upcoming()
            }
          : const CircularProgressIndicator(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 1) {
            context.push('/discover', extra: state.products);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined),
            label: 'email',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'account',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
