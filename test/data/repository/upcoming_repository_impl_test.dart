import 'package:flutter_test/flutter_test.dart';
import 'package:snkr/data/api/upcoming_api_impl.dart';
import 'package:snkr/data/repository/upcoming_repository_impl.dart';

void main() {
  test('Upcoming Product Repository Impl Test', () async {
    final respository = UpcomingRepositoryImpl(UpcomingApiImpl());

    final upcomingProducts = await respository.getUpcomingProducts();

    expect(upcomingProducts.length, 6);
    expect(upcomingProducts[0].productNameKr, '나이키 SB 덩크 로우');
  });
}
