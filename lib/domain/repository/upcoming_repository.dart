import 'package:snkr/domain/model/upcoming.dart';

abstract interface class UpcomingRepository {
  Future<List<Upcoming>> getUpcomingProducts();
}
