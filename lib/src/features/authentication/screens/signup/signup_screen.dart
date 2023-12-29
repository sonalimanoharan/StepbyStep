// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trail2/src/constants/image_string.dart';
import 'package:trail2/src/constants/size.dart';
import 'package:trail2/src/constants/text_string.dart';
import 'package:trail2/src/features/authentication/screens/signup/widget/signup_form_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FormHeaderWidget(
                  image: twelcomeImage,
                  title: tsignuptitle,
                  subtitle: tsignupsubtitle,
                ),
                SignUpFormWidget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ignore: prefer_const_constructors
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
                              text: alredyhaveaccount,
                              style: Theme.of(context).textTheme.bodySmall,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                TextSpan(
                                  text: tLogin,
                                  style: TextStyle(color: Colors.blue),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
