// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_string.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("OR"),
        SizedBox(
          height: tFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Image(
              image: AssetImage(twelcomeImage),
              width: 20.0,
              height: 20.0,
            ),
            label: Text(tSignInWithGoogle),
          ),
        ),
        SizedBox(
          height: tFormHeight - 20,
        ),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Text.rich(
              TextSpan(
                  text: tDontHaveAccount,
                  style: Theme.of(context).textTheme.bodySmall,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextSpan(
                      text: tSignUp,
                      style: TextStyle(color: Colors.blue),
                    )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
