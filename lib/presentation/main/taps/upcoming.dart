import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snkr/presentation/main/main_view_model.dart';

import '../main_state.dart';

class Upcoming extends StatelessWidget {
  final MainState state;
  DateTime currentDate = DateTime.now();

  Upcoming({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        ...state.upcomings.map((e) {
          currentDate = currentDate.add(const Duration(days: 1));
          return SliverMainAxisGroup(slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: HeaderDelegate(
                  '${DateFormat("MM").format(currentDate)}월 ${DateFormat("dd").format(currentDate)}일'),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    child: Image.network(
                      e.productImgUrls.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.productNameKr,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          e.productNameEn,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]))
          ]);
        })
      ],
    ));
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final double height = 50;

  const HeaderDelegate(this.title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
