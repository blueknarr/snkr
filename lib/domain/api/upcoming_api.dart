import 'package:snkr/data/dto/Upcoming_dto.dart';

abstract interface class UpcomingApi {
  Future<List<UpcomingDto>> getUpcomingProducts();
}
