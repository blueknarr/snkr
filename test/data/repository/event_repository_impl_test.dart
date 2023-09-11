import 'package:flutter_test/flutter_test.dart';
import 'package:snkr/data/api/event_api_impl.dart';
import 'package:snkr/data/repository/event_repository_impl.dart';

void main() {
  test('Event Repository Impl Test', () async {
    final respository = EventRepositoryImpl(EventApiImpl());
    final events = await respository.getEvents();

    expect(events.length, 6);
    expect(events[0].title, 'SNKRS Day Event');
  });
}
