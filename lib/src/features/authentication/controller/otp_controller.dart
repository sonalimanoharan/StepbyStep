import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/screens/dashboard_client/dashboardclient.dart';
import 'package:trail2/src/features/authentication/screens/details_screen/userdetails.dart';
import 'package:trail2/src/features/authentication/screens/details_screen/widget/userdetailwidget.dart';
import 'package:trail2/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';

import '../screens/dashboard_user copy/dashboard.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();
  Future<void> verifyOTP(String otp) async {
    var isverified = await AuthenticationRepository.instance.verifyOTP(otp);
    isverified ? Get.offAll(SignUpScreen()) : Get.back();
  }
}
