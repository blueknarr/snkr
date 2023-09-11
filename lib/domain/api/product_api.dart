import 'package:snkr/data/dto/product_dto.dart';

abstract interface class ProductApi {
  Future<List<ProductDto>> getProducts();
}
