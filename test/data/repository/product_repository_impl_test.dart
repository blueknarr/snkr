import 'package:flutter_test/flutter_test.dart';
import 'package:snkr/data/api/product_api_impl.dart';
import 'package:snkr/data/repository/product_repository_impl.dart';

void main() {
  test('Product Repository Impl Test', () async {
    final repository = ProductRepositoryImpl(ProductApiImpl());
    final products = await repository.getProducts();

    expect(products.length, 120);
    expect(products[0].brand, '베자');
  });
}
