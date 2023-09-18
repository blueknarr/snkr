import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snkr/presentation/main/components/product_carousel_slider.dart';

import '../../../domain/model/product.dart';

class ProductModalBottomSheet {
  static void show(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.87,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop();
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      print('share');
                    },
                  )
                ],
                title: Text(
                  product.productNameEn,
                  style: const TextStyle(fontSize: 16),
                ),
                floating: false,
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductCarouselSlider(imgList: product.productImgUrls),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.productNameKr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                product.productNameEn,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '${product.price}원',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '사이즈: ${product.productSizes.first} ~ ${product.productSizes.last}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '소재: ${product.material}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '색상: ${product.color}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '굽높이: ${product.heelSized}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '제조자: ${product.countryOfManufacture}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '품질보증기준: ${product.qualityAssuranceStandard}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: FilledButton.tonal(
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(200, 60)),
                                    backgroundColor:
                                        const MaterialStatePropertyAll<Color>(
                                            Colors.black),
                                  ),
                                  onPressed: () {
                                    print('Notify Me');
                                  },
                                  child: Text(
                                    '${product.price}원',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
