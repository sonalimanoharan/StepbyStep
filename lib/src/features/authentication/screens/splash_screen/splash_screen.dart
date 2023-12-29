import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:trail2/src/constants/image_string.dart';
import 'package:trail2/src/features/authentication/screens/welcome/welcome_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_string.dart';
import 'package:trail2/src/features/authentication/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashscreencontroller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashscreencontroller.startanimation();
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Obx(() => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  //left: 100,
                  top: splashscreencontroller.animate.value ? 0 : -30,
                  //left: splashscreencontroller.animate.value ? 0 : -30,
                  //bottom: splashscreencontroller.animate.value ? 1 : 100,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(100, 100, 0, 100),
                    child: const Image(
                      image: AssetImage(tSplashTopIcon),
                      width: 200,
                      height: 200,
                    ),
                  ),
                )),

            // ignore: prefer_const_constructors
            Obx(() => AnimatedPositioned(
                  duration: const Duration(milliseconds: 2400),
                  //top: splashscreencontroller.animate.value ? 0 : -30,
                  //right: splashscreencontroller.animate.value ? 0 : 100,
                  //left: splashscreencontroller.animate.value ? 0 : -30,
                  bottom: splashscreencontroller.animate.value ? 1 : 100,
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(200, 0, 0, 100),
                    child: Image(
                      // ignore: prefer_const_constructors
                      image: AssetImage(tSplashImage),
                      width: 200,
                      height: 200,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
