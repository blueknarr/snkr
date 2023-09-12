import 'package:flutter/cupertino.dart';
import 'package:snkr/core/result/result.dart';
import 'package:snkr/domain/use_case/get_event_use_case.dart';
import 'package:snkr/presentation/discover/discover_state.dart';

class DiscoverViewModel with ChangeNotifier {
  final GetEventUseCase _getEventUseCase;

  DiscoverViewModel(this._getEventUseCase) {
    fetchEvents();
  }

  DiscoverState _state = const DiscoverState();

  DiscoverState get state => _state;

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
}
