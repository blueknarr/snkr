import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../domain/model/event.dart';
import '../../domain/model/product.dart';
import '../../domain/model/upcoming.dart';

part 'main_state.freezed.dart';

part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<Product> products,
    @Default([]) List<Event> events,
    @Default([]) List<Upcoming> upcomings,
    @Default([]) List<Product> searchedProduct,
    @Default({}) Map<String, bool> keywords,
    @Default({}) Map<String, Product> cart,
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(0) int appBarIndex,
    @Default(0) int bottomNavigatorBarIndex,
  }) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) =>
      _$MainStateFromJson(json);
}
