import 'package:snkr/data/dto/event_dto.dart';

import '../../domain/model/event.dart';

extension ToEvent on EventDto {
  Event toEvent() {
    return Event(
      title: title,
      eventImgUrl: eventImgUrl,
      subTitle: subTitle,
    );
  }
}
