import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductCarouselSlider extends StatelessWidget {
  final List<String> imgList;

  const ProductCarouselSlider({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: imgList
            .map((e) => Image.network(
                  e,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ))
            .toList(),
        options: CarouselOptions(
          height: 300,
          viewportFraction: 1,
        ),
      ),
    );
  }
}
