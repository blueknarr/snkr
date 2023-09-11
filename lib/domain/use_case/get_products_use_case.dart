import 'package:snkr/core/result/result.dart';
import 'package:snkr/domain/model/product.dart';
import 'package:snkr/domain/repository/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Result<List<Product>>> execute() async {
    try {
      final products = await repository.getProducts();
      return Result.success(products);
    } catch (e) {
      return Result.error('$e');
    }
  }
}
