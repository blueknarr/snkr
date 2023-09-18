import 'package:injectable/injectable.dart';
import 'package:snkr/domain/model/upcoming.dart';
import 'package:snkr/domain/repository/upcoming_repository.dart';

import '../../core/result/result.dart';

@singleton
class GetUpcomingUseCase {
  final UpcomingRepository repository;

  GetUpcomingUseCase(this.repository);

  Future<Result<List<Upcoming>>> execute() async {
    try {
      final upcoming = await repository.getUpcomingProducts();
      return Result.success(upcoming);
    } catch (e) {
      return Result.error('$e');
    }
  }
}
