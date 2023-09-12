import 'package:flutter/material.dart';

class FeedImageContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;

  const FeedImageContainer({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: Container(
            width: double.infinity,
            height: 400,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 15,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 40,
          left: 15,
          child: Text(
            subTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 360,
          left: 15,
          child: GestureDetector(
            onTap: () {
              print('share ui');
            },
            child: const Icon(
              Icons.share,
            ),
          ),
        ),
        Positioned(
          top: 345,
          left: 285,
          child: FilledButton.tonal(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
            ),
            onPressed: () {
              print('Notify Me');
            },
            child: const Text(
              'Notify Me',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
