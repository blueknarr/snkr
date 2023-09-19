import 'package:flutter/material.dart';
import 'package:snkr/presentation/main/main_view_model.dart';
import '../main_screen.dart';

class MainCustomAppBar extends StatefulWidget {
  //final void Function() onChangeAppBarIndex; 기본형
  final void Function(String menu) onChangeAppBarIndex;
  final void Function() onSearchClick;

  const MainCustomAppBar({
    Key? key,
    required this.onChangeAppBarIndex,
    required this.onSearchClick,
  }) : super(key: key);

  @override
  State<MainCustomAppBar> createState() => _MainCustomAppBarState();
}

class _MainCustomAppBarState extends State<MainCustomAppBar> {
  String selectedMenu = 'Feed';

  void selectMenu(String menu) {
    setState(() {
      selectedMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              buildMenuItem('Feed'),
              buildMenuItem('In Stock'),
              buildMenuItem('Upcoming'),
            ],
          ),
          IconButton(
            onPressed: widget.onSearchClick,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(String menu) {
    final isSelected = selectedMenu == menu;

    // Text 위젯으로 글자 길이를 계산
    final text = Text(
      menu,
      style: TextStyle(
        color: isSelected ? Colors.black87 : Colors.black38,
      ),
    );
    final textPainter = TextPainter(
      text: TextSpan(text: text.data),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    return InkWell(
      onTap: () {
        selectMenu(menu);
        widget.onChangeAppBarIndex(menu);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        child: Column(
          children: [
            text,
            if (isSelected)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                child: Container(
                  height: 4,
                  width: textPainter.width, // 글자 길이에 따라 밑줄의 너비 설정
                  color: Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
