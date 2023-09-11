import 'package:snkr/domain/model/event.dart';
import 'package:snkr/domain/repository/event_repostitory.dart';

import '../../core/result/result.dart';

class GetEventUseCase {
  final EventRepository repository;

  GetEventUseCase(this.repository);

  Future<Result<List<Event>>> execute() async {
    try {
      final event = await repository.getEvents();
      return Result.success(event);
    } catch (e) {
      return Result.error('$e');
    }
  }
}
