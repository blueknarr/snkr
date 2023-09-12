import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr/presentation/discover/discover_view_model.dart';

import '../../domain/model/product.dart';

class DiscoverScreen extends StatelessWidget {
  final List<Product> products;
  const DiscoverScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DiscoverViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('${products.length}'),
      ),
      body: Text('${state.events}'),
    );
  }
}
