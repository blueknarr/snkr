import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imgUrl;
  final String productNameKr;
  final String productNameEn;

  const ImageCard({
    Key? key,
    required this.imgUrl,
    required this.productNameKr,
    required this.productNameEn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: Card(
        elevation: 0,
        child: Container(
          height: 280,
          width: 150,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                productNameKr,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                productNameEn,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
