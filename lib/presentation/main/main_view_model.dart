import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:snkr/core/result/result.dart';
import 'package:snkr/domain/use_case/get_products_use_case.dart';
import 'package:snkr/presentation/main/main_state.dart';

import '../../domain/use_case/get_event_use_case.dart';
import '../../domain/use_case/get_upcoming_use_case.dart';

@singleton
class MainViewModel with ChangeNotifier {
  final GetProductsUseCase _getProductsUseCase;
  final GetEventUseCase _getEventUseCase;
  final GetUpcomingUseCase _getUpcomingUseCase;

  MainViewModel(
    this._getProductsUseCase,
    this._getEventUseCase,
    this._getUpcomingUseCase,
  ) {
    fetchProducts();
    fetchEvents();
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

  Future<void> fetchEvents() async {
    final events = await _getEventUseCase.execute();

    switch (events) {
      case Success(:final data):
        _state = state.copyWith(
          events: data,
        );
        notifyListeners();
      case Error(:final e):
        _state = state.copyWith();
        notifyListeners();
    }
  }

  void changeSearchingStatus() {
    _state = state.copyWith(
      isSearching: !state.isSearching,
    );
    notifyListeners();
  }

  void changeAppBarIndex(String menu) {
    Map<String, int> appBarIndex = {'Feed': 0, 'In Stock': 1, 'Upcoming': 2};

    _state = state.copyWith(
      appBarIndex: appBarIndex[menu]!,
    );
    notifyListeners();
  }

  void changeBottomNavigatorBarIndex(int index) {
    _state = state.copyWith(
      bottomNavigatorBarIndex: index,
    );
    notifyListeners();
  }
}
