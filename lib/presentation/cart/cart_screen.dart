import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr/presentation/cart/components/cart_items.dart';

import '../main/main_view_model.dart';
import 'components/default_message.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: Column(
            children: [
              Container(
                height: 40,
                child: const TabBar(
                  labelColor: Colors.black, // 활성화된 Tab 글씨 색상을 검은색으로 설정
                  unselectedLabelColor: Colors.grey, // 비활성화된 Tab 글씨 색상을 회색으로 설정
                  indicatorColor: Colors.black, // Tab 선택 시 밑줄 색상을 검은색으로 설정
                  tabs: [
                    Tab(text: '알림'),
                    Tab(text: '장바구니'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const DefaultMessage(
                        title: '메시지 없음',
                        subTitle: '여기에 나이키 SNKRS의 주요 알림 및 메시지가 표시됩니다.'),
                    state.cart.isEmpty
                        ? const DefaultMessage(
                            title: '주문 없음', subTitle: '아직 구매한 상품이 없습니다.')
                        : CartItems(
                            cart: state.cart,
                            onCartRemoveTap: (String productCode) {
                              viewModel.removeCart(productCode);
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
