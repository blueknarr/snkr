import 'package:flutter/material.dart';
import 'package:snkr/domain/model/event.dart';

import 'image_card.dart';

class EventItems extends StatelessWidget {
  final String title;
  final List<Event> items;
  const EventItems({Key? key, required this.title, required this.items})
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
              ...items.map((e) => ImageCard(
                    imgUrl: e.eventImgUrl,
                    productNameKr: e.title,
                    productNameEn: e.subTitle,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
