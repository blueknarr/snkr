import 'package:flutter/foundation.dart';
import 'package:snkr/core/result/result.dart';
import 'package:snkr/domain/use_case/get_products_use_case.dart';
import 'package:snkr/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final GetProductsUseCase _getProductsUseCase;

  MainViewModel(this._getProductsUseCase) {
    fetchProducts();
  }

  MainState _state = const MainState();

  MainState get state => _state;

  Future<void> fetchProducts() async {
    final products = await _getProductsUseCase.execute();

    switch (products) {
      case Success(:final data):
        _state = state.copyWith(
          products: data,
          isLoading: true,
        );
        notifyListeners();
      case Error(:final e):
        _state = state.copyWith();
    }
  }

  void changeAppBarIndex(String menu) {
    Map<String, int> appBarIndex = {'Feed': 0, 'In Stock': 1, 'Upcoming': 2};

    _state = state.copyWith(
      appBarIndex: appBarIndex[menu]!,
    );
    notifyListeners();
  }
}
