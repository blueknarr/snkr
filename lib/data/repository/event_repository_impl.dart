import 'package:injectable/injectable.dart';
import 'package:snkr/data/api/event_api_impl.dart';
import 'package:snkr/data/mapper/event_mapper.dart';
import 'package:snkr/domain/model/event.dart';

import '../../domain/repository/event_repostitory.dart';

@Singleton(as: EventRepository)
class EventRepositoryImpl implements EventRepository {
  final EventApiImpl api;

  EventRepositoryImpl(this.api);

  @override
  Future<List<Event>> getEvents() async {
    final eventDto = await api.getEvents();

    return eventDto.map((e) => e.toEvent()).toList();
  }
}
