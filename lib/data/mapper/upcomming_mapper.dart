import 'package:snkr/data/dto/Upcoming_dto.dart';

import '../../domain/model/upcoming.dart';

extension ToUpcoming on UpcomingDto {
  Upcoming toUpcoming() {
    return Upcoming(
      productNameKr: productNameKr,
      productNameEn: productNameEn,
      productImgUrls: productImgUrls,
      price: price,
      content: content,
    );
  }
}
