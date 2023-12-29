import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:trail2/src/features/authentication/screens_client/signup/signup_screen.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/authentication_repository_client/authentication_repository.dart';

class OTPControllerClient extends GetxController {
  static OTPControllerClient get instance => Get.find();
  Future<void> verifyOTP(String otp) async {
    var isverified =
        await AuthenticationRepositoryClient.instance.verifyOTP(otp);
    isverified ? Get.offAll(SignUpScreenClient()) : Get.back();
  }
}
