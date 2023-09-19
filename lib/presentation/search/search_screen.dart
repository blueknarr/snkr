import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../main/main_view_model.dart';
import 'components/recent_keyword.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    final textController = TextEditingController();
    bool deleteSearchProduct = false;
    Timer? timer;

    @override
    void dispose() {
      textController.dispose();
      timer!.cancel();
      super.dispose();
    }

    void searchTextChanged(String keyword) {
      if (timer != null && timer!.isActive) {
        timer!.cancel();
      }

      timer = Timer(const Duration(milliseconds: 1500), () {
        print(keyword);
        viewModel.keywordAdd(keyword);
        viewModel.searchProduct(keyword);
        setState(() {
          deleteSearchProduct = !deleteSearchProduct;
        });
      });
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: SafeArea(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(0, 2),
                    blurRadius: 0.5,
                    spreadRadius: 1.1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: searchTextChanged,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: '검색',
                          contentPadding: const EdgeInsets.all(8),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  deleteSearchProduct = !deleteSearchProduct;
                                  viewModel.removeSearchedProduct();
                                });
                              },
                              icon: Icon(Icons.close))),
                      cursorWidth: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          //context.go('/');
                          context.pop();
                          viewModel.changeSearchingStatus();
                        },
                        child: const Text('취소')),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: (!deleteSearchProduct && state.searchedProduct.isNotEmpty)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    ...state.searchedProduct.map((e) {
                      return Column(
                        children: [
                          ListTile(
                            leading: SizedBox(
                              height: 80,
                              width: 70,
                              child: Image.network(
                                e.productImgUrls.first,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(e.productNameKr),
                            subtitle: Text(e.productNameEn),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 0.4,
                          )
                        ],
                      );
                    })
                  ],
                ),
              )
            : state.keywords.isNotEmpty
                ? RecentKeyword(
                    state: state,
                    onCancleClick: () {
                      viewModel.keywordRemove();
                    },
                  )
                : null);
  }
}
