import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:trail2/src/repository/exceptions/signup_email_password_failure.dart';

import '../../features/authentication/screens/dashboard_client/dashboardclient.dart';
import '../../features/authentication/screens/details_screen/widget/userdetailwidget.dart';
import '../../features/authentication/screens_client/details_screen/widget/userdetailwidget.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth =
      FirebaseAuth.instance; // instate firebase to connets with the cloud
  late final Rx<User?> firebaseUser; // for the cloud to be respnsive
  var verificationId = ''.obs;
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setIntialScreen);
  }

  _setIntialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => Dashboardclient());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar('error', 'the phone number is not valid');
        } else {
          Get.snackbar('error', 'something went wrong');
        }
      },
      codeSent: (verficationId, resendtoken) {
        this.verificationId.value = verficationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: verificationId.value, smsCode: otp),
    );
    return credentials.user != null ? true : false;
  }

  Future<void> creatUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => Userdetailwidget())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = Signupwithemailandpasswordfailure.code(e.code);
      print('firebase auth exception -${ex.messages}');
      throw ex;
    } catch (_) {
      const ex = Signupwithemailandpasswordfailure();
      print('exception -${ex.messages}');
      throw ex;
    }
  }

  Future<void> creatClientWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => UserdetailwidgetClient())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = Signupwithemailandpasswordfailure.code(e.code);
      print('firebase auth exception -${ex.messages}');
      throw ex;
    } catch (_) {
      const ex = Signupwithemailandpasswordfailure();
      print('exception -${ex.messages}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
