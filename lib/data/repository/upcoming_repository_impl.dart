import 'package:snkr/data/api/upcoming_api_impl.dart';
import 'package:snkr/data/mapper/upcomming_mapper.dart';
import 'package:snkr/domain/model/upcoming.dart';
import 'package:snkr/domain/repository/upcoming_repository.dart';

class UpcomingRepositoryImpl implements UpcomingRepository {
  final UpcomingApiImpl api;

  UpcomingRepositoryImpl(this.api);

  @override
  Future<List<Upcoming>> getUpcomingProducts() async {
    final upcomingDto = await api.getUpcomingProducts();

    return upcomingDto.map((e) => e.toUpcoming()).toList();
  }
}
