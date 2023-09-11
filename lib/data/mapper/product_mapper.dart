import 'package:snkr/data/dto/product_dto.dart';

import 'package:snkr/domain/model/product.dart';

extension ToProduct on ProductDto {
  Product toProduct() {
    return Product(
        brand: brand,
        productNameKr: productNameKr,
        productNameEn: productNameEn,
        productImgUrls: productImgUrls,
        productCode: productCode,
        price: price,
        color: color,
        productSizes: productSizes,
        material: material,
        sizeInfo: sizeInfo,
        heelSized: heelSized,
        manufacturer: manufacturer,
        countryOfManufacture: countryOfManufacture,
        contact: contact,
        yearOfManufacture: yearOfManufacture,
        qualityAssuranceStandard: qualityAssuranceStandard);
  }
}
