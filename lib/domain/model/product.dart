import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String brand,
    required String productNameKr,
    required String productNameEn,
    required List<String> productImgUrls,
    required String productCode,
    required String price,
    required String color,
    required List<String> productSizes,
    required String material,
    required String sizeInfo,
    required String heelSized,
    required String manufacturer,
    required String countryOfManufacture,
    required String contact,
    required String yearOfManufacture,
    required String qualityAssuranceStandard,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
