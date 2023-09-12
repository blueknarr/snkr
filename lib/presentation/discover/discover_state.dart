import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../domain/model/event.dart';

part 'discover_state.freezed.dart';

part 'discover_state.g.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    @Default([]) List<Event> events,
  }) = _DiscoverState;

  factory DiscoverState.fromJson(Map<String, Object?> json) =>
      _$DiscoverStateFromJson(json);
}
