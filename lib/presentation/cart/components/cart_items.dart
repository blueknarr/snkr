import 'package:flutter/material.dart';
import 'package:snkr/domain/model/product.dart';

class CartItems extends StatelessWidget {
  final Map<String, Product> cart;
  final void Function(String productCode) onCartRemoveTap;
  const CartItems({Key? key, required this.cart, required this.onCartRemoveTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          ...cart.entries.map((e) {
            return Column(
              children: [
                ListTile(
                  leading: SizedBox(
                    height: 80,
                    width: 70,
                    child: Image.network(
                      e.value.productImgUrls.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(e.value.productNameKr),
                  subtitle: Text(e.value.productNameEn),
                  trailing: GestureDetector(
                    onTap: () {
                      onCartRemoveTap(e.value.productCode);
                    },
                    child: const Icon(Icons.close),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.4,
                )
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
