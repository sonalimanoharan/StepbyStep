// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../constants/size.dart';
import 'widget/Login_Header_Widget.dart';
import 'widget/login_footer.dart';
import 'widget/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                LoginHeaderWidget(),
                // ignore: prefer_const_constructors
                LoginForm(),
                LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
