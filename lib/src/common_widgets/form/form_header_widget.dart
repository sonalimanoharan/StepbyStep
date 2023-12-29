// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

import '../../constants/image_string.dart';

class FormHeaderWidget extends StatelessWidget {
  final double? heightBetween;
  final double imageHeight;
  final Color? imageColor;
  final CrossAxisAlignment crossAxisAlignment;
  final String image, title, subtitle;
  final TextAlign? textAlign;

  const FormHeaderWidget({
    this.imageColor,
    this.imageHeight = 0.2,
    this.heightBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
    required this.image,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image(
          image: AssetImage(twelcomeImage),
          width: 50,
          height: size.height * 0.2,
          alignment: Alignment.topLeft,
        ),
        Image(
          image: AssetImage(image),
          height: 100,
          width: 100,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
