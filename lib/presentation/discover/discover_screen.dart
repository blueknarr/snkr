import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main/main_view_model.dart';
import 'components/event_items.dart';
import 'components/product_items.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(0, 2),
                    blurRadius: 0.5,
                    spreadRadius: 1.1,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Discover',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            children: [
              EventItems(items: state.events, title: 'SNKRS Style'),
              ProductItems(
                  items: state.products.where((e) => e.brand == '나이키').toList(),
                  title: '나이키'),
              ProductItems(
                  items:
                      state.products.where((e) => e.brand == '아디다스').toList(),
                  title: '아디다스'),
              ProductItems(
                  items: state.products.where((e) => e.brand == '휠라').toList(),
                  title: '휠라'),
              ProductItems(
                  items:
                      state.products.where((e) => e.brand == '뉴발란스').toList(),
                  title: '뉴발란스'),
              ProductItems(
                  items: state.products.where((e) => e.brand == '푸마').toList(),
                  title: '푸마'),
            ],
          ),
        ),
      ),
    );
  }
}
