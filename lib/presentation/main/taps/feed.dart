import 'package:flutter/material.dart';
import 'package:snkr/presentation/main/main_state.dart';

import '../components/feed_image_container.dart';
import '../components/product_modal_bottom_sheet.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key, required this.state}) : super(key: key);
  final MainState state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...state.products.where((e) => e.brand == '나이키').map((e) {
          return GestureDetector(
            onTap: () {
              ProductModalBottomSheet.show(context, e);
            },
            child: FeedImageContainer(
              imageUrl: e.productImgUrls[0],
              title: e.productNameKr,
              subTitle: e.productNameEn,
            ),
          );
        })
      ],
    );
  }
}
