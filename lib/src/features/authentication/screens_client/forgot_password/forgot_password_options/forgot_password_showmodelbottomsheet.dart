// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/screens/forgot_password/forgot_password_phone/forgpt_password_phone.dart';
import 'package:trail2/src/features/authentication/screens_client/forgot_password/forgot_password_phone/forgpt_password_phone.dart';

import '../../../../../constants/size.dart';
import '../../../../../constants/text_string.dart';
import '../forgot_password_mail/forgot_password_mail.dart';
import 'forgor_password_btn_widget.dart';

class ForgotPasswordsScreenClient {
  static Future<dynamic> Forgotpasswordshowmodelbottomsheet(
      BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tforgotpasswordtite,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              tforgotpasswordsubtite,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 30.0,
            ),
            ForgotPasswordsShowButtonWidgetClient(
              btnicon: Icons.mail_outline_rounded,
              btntitle: tEmail,
              btnsubtitle: tresetpasswordemail,
              ontap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordMailClient());
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ForgotPasswordsShowButtonWidgetClient(
              btnicon: Icons.mobile_friendly_rounded,
              btntitle: tPhoneNo,
              btnsubtitle: tresetpasswordphone,
              ontap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordPhoneClient());
              },
            ),
          ],
        ),
      ),
    );
  }
}
