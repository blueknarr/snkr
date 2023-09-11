class UpcomingDto {
  UpcomingDto({
    required this.productNameKr,
    required this.productNameEn,
    required this.productImgUrls,
    required this.price,
    required this.content,
  });

  UpcomingDto.fromJson(dynamic json) {
    productNameKr = json['productNameKr'];
    productNameEn = json['productNameEn'];
    productImgUrls = json['productImgUrls'] != null
        ? json['productImgUrls'].cast<String>()
        : [];
    price = json['price'];
    content = json['content'];
  }
  late String productNameKr;
  late String productNameEn;
  late List<String> productImgUrls;
  late String price;
  late String content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productNameKr'] = productNameKr;
    map['productNameEn'] = productNameEn;
    map['productImgUrls'] = productImgUrls;
    map['price'] = price;
    map['content'] = content;
    return map;
  }
}
