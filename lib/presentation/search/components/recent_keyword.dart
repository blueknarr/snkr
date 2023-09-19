import 'package:flutter/material.dart';

import '../../main/main_state.dart';

class RecentKeyword extends StatelessWidget {
  final MainState state;
  final void Function() onCancleClick;

  const RecentKeyword({
    Key? key,
    required this.onCancleClick,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '최근 검색',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: onCancleClick,
                    child: const Icon(Icons.cancel),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ...state.keywords.entries.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      e.key,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
