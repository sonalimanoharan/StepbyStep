// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trail2/src/constants/size.dart';
import 'package:trail2/src/constants/text_string.dart';
import 'package:trail2/src/features/authentication/controller/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(totptitle,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 80.0)),
            Text(
              totpsubtitle.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "$totpmessage  sonali712003@gmai.com",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  OTPController.instance.verifyOTP(otp);
                },
                child: Text(tNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
