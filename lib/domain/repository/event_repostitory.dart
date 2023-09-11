import '../model/event.dart';

abstract interface class EventRepository {
  Future<List<Event>> getEvents();
}
