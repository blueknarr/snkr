class ProductDto {
  ProductDto({
    required this.brand,
    required this.productNameKr,
    required this.productNameEn,
    required this.productImgUrls,
    required this.productCode,
    required this.price,
    required this.color,
    required this.productSizes,
    required this.material,
    required this.sizeInfo,
    required this.heelSized,
    required this.manufacturer,
    required this.countryOfManufacture,
    required this.contact,
    required this.yearOfManufacture,
    required this.qualityAssuranceStandard,
  });

  ProductDto.fromJson(dynamic json) {
    brand = json['brand'];
    productNameKr = json['productNameKr'];
    productNameEn = json['productNameEn'];
    productImgUrls = json['productImgUrls'] != null
        ? json['productImgUrls'].cast<String>()
        : [];
    productCode = json['productCode'];
    price = json['price'];
    color = json['color'];
    productSizes =
        json['productSizes'] != null ? json['productSizes'].cast<String>() : [];
    material = json['material'];
    sizeInfo = json['sizeInfo'];
    heelSized = json['heelSized'];
    manufacturer = json['manufacturer'];
    countryOfManufacture = json['countryOfManufacture'];
    contact = json['contact'];
    yearOfManufacture = json['yearOfManufacture'];
    qualityAssuranceStandard = json['qualityAssuranceStandard'];
  }
  late String brand;
  late String productNameKr;
  late String productNameEn;
  late List<String> productImgUrls;
  late String productCode;
  late String price;
  late String color;
  late List<String> productSizes;
  late String material;
  late String sizeInfo;
  late String heelSized;
  late String manufacturer;
  late String countryOfManufacture;
  late String contact;
  late String yearOfManufacture;
  late String qualityAssuranceStandard;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brand'] = brand;
    map['productNameKr'] = productNameKr;
    map['productNameEn'] = productNameEn;
    map['productImgUrls'] = productImgUrls;
    map['productCode'] = productCode;
    map['price'] = price;
    map['color'] = color;
    map['productSizes'] = productSizes;
    map['material'] = material;
    map['sizeInfo'] = sizeInfo;
    map['heelSized'] = heelSized;
    map['manufacturer'] = manufacturer;
    map['countryOfManufacture'] = countryOfManufacture;
    map['contact'] = contact;
    map['yearOfManufacture'] = yearOfManufacture;
    map['qualityAssuranceStandard'] = qualityAssuranceStandard;
    return map;
  }
}
