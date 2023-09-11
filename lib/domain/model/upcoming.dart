import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming.freezed.dart';

part 'upcoming.g.dart';

@freezed
class Upcoming with _$Upcoming {
  const factory Upcoming({
    required String productNameKr,
    required String productNameEn,
    required List<String> productImgUrls,
    required String price,
    required String content,
  }) = _Upcoming;

  factory Upcoming.fromJson(Map<String, Object?> json) =>
      _$UpcomingFromJson(json);
}
