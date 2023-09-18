import 'package:flutter/material.dart';

import '../../../domain/model/product.dart';
import '../../main/components/product_modal_bottom_sheet.dart';
import 'image_card.dart';

class ProductItems extends StatelessWidget {
  final String title;
  final List<Product> items;
  const ProductItems({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 20, 0, 10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...items.map((e) => GestureDetector(
                    onTap: () {
                      ProductModalBottomSheet.show(context, e);
                    },
                    child: ImageCard(
                      imgUrl: e.productImgUrls.first,
                      productNameKr: e.productNameKr,
                      productNameEn: e.productNameEn,
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
