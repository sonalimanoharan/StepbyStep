import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:trail2/src/constants/colors.dart';
import 'package:trail2/src/constants/image_string.dart';
import 'package:trail2/src/features/authentication/screens/login/login.dart';
import 'package:trail2/src/features/authentication/screens/separate/clientoruser.dart';

import '../../../../constants/size.dart';
import '../../../../constants/text_string.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    var brightness = mediaquery.platformBrightness;
    var height = mediaquery.size.height;
    var isDarkMode = (brightness == Brightness.dark);
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ignore: prefer_const_constructors
            Image(
              image: AssetImage(twelcomeImage),
              width: 50,
              height: 50,
              alignment: Alignment.topLeft,
            ),
            Image(
              image: AssetImage(twelcomeImage),
              height: height * 0.6,
              width: 400,
            ),
            Column(
              children: [
                Text(
                  tWelcomeScreenText,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  tWelcomeScreenSubText,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () => Get.to(() => const LoginScreen()),
                        child: Text(tLogin.toUpperCase()))),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => clientuser()),
                        child: Text(tSignup.toUpperCase()))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
