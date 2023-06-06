import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final dynamic color;
  const OnboardContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.content,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: 250,
          ),
          const Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
