import 'package:injectable/injectable.dart';
import 'package:snkr/data/api/product_api_impl.dart';
import 'package:snkr/data/mapper/product_mapper.dart';
import 'package:snkr/domain/model/product.dart';

import 'package:snkr/domain/repository/product_repository.dart';

@Singleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductApiImpl api;

  ProductRepositoryImpl(this.api);

  @override
  Future<List<Product>> getProducts() async {
    final productDto = await api.getProducts();

    return productDto.map((e) => e.toProduct()).toList();
  }
}
