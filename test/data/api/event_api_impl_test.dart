import 'package:flutter_test/flutter_test.dart';
import 'package:snkr/data/api/event_api_impl.dart';

void main() {
  test('Event Api Impl Test', () async {
    final api = EventApiImpl();
    final events = await api.getEvents();

    expect(events.length, 6);
    expect(events[0].title, 'SNKRS Day Event');
  });
}
