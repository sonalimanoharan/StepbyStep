// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trail2/src/constants/size.dart';
import 'package:trail2/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';

class ForgotPasswordMail extends StatelessWidget {
  const ForgotPasswordMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(
            tDefaultSize,
          ),
          child: Column(
            children: [
              SizedBox(
                height: tDefaultSize * 4,
              ),
              FormHeaderWidget(
                image: tForgotPasswordImage,
                title: tforgotpasswordtite,
                subtitle: tforgotpasswordsubtite,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30.0,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: tFormHeight,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(tEmail),
                      hintText: tEmail,
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const OtpScreen());
                      },
                      child: Text(tNext),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
