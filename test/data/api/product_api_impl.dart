import 'package:flutter_test/flutter_test.dart';
import 'package:snkr/data/api/product_api_impl.dart';

void main() {
  test('Product Api Test', () async {
    final dto = ProductApiImpl();

    final productList = await dto.getProducts();

    expect(productList.length, 120);
  });
}
