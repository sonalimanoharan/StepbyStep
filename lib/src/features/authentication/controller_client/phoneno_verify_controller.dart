// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/models/user_model.dart';
import 'package:trail2/src/features/authentication/screens_client/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/authentication_repository_client/authentication_repository.dart';
import 'package:trail2/src/repository/users_repository/users_repository.dart';
import 'package:trail2/src/repository/users_repository_client/users_repository.dart';

import '../models/phoneno_verify_model.dart';
import '../screens/forgot_password/forgot_password_otp/otp_screen.dart';

class PhonenoControllerClient extends GetxController {
  static PhonenoControllerClient get instance => Get.find();
  final phoneno = TextEditingController();

  final userRepo = Get.put(UserRepositoryClient());

  void RegisterUser(String email, String password) {
    String? error = AuthenticationRepositoryClient.instance
        .creatUserWithEmailAndPassword(email, password) as String;
    if (error != null) {
      Get.showSnackbar(
        GetSnackBar(
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> verifyUser(PhonenoModel user) async {
    phoneAuthentication(user.phoneNo);
    Get.to(() => OtpScreenClient());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
