import 'package:snkr/data/dto/event_dto.dart';

abstract interface class EventApi {
  Future<List<EventDto>> getEvents();
}
