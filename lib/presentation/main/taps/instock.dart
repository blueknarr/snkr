import 'package:flutter/material.dart';
import '../components/product_modal_bottom_sheet.dart';
import '../main_state.dart';

class Instock extends StatelessWidget {
  const Instock({Key? key, required this.state}) : super(key: key);
  final MainState state;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: state.products.length,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      ProductModalBottomSheet.show(
                          context, state.products[index]);
                    },
                    child: Card(
                      child: Image.network(
                        state.products[index].productImgUrls[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ));
            },
          ),
        )
      ],
    );
  }
}
