import 'package:flutter_test/flutter_test.dart';
import 'package:snkr/data/api/upcoming_api_impl.dart';

void main() {
  test('Upcoming Product Api Impl Test', () async {
    final api = UpcomingApiImpl();
    final upcomingProducts = await api.getUpcomingProducts();

    expect(upcomingProducts.length, 6);
    expect(upcomingProducts[0].productNameKr, '나이키 SB 덩크 로우');
  });
}
