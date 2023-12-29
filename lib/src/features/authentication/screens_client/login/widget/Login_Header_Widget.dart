// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';

class LoginHeaderWidgetClient extends StatelessWidget {
  const LoginHeaderWidgetClient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(twelcomeImage),
          width: 50,
          height: 50,
          alignment: Alignment.topLeft,
        ),
        Image(image: AssetImage(twelcomeImage)),
        Text(
          tlogintitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          tloginsubtitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
