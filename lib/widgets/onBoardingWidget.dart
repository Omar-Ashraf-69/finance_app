
import 'package:finanice_app/colors/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 33,
            color: kPrimaryPurbleColor,
          ),
        ),
        Image.asset(
          image,
          width: double.infinity,
        ),
        Text(subTitle),
      ],
    );
  }
}
