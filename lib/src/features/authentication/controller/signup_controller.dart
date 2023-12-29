// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/models/user_model.dart';
import 'package:trail2/src/features/authentication/screens/details_screen/userdetails.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/users_repository/users_repository.dart';

import '../screens/forgot_password/forgot_password_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneno = TextEditingController();
  final youtube = TextEditingController();
  final youtubelink = TextEditingController();
  final tiktok = TextEditingController();
  final tiktoklink = TextEditingController();
  final insta = TextEditingController();
  final instalink = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void RegisterUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .creatUserWithEmailAndPassword(email, password) as String;
    if (error != null) {
      Get.showSnackbar(
        GetSnackBar(
          message: error.toString(),
        ),
      );
    }
  }

  encoding() {
    var bytes = utf8.encode(password.text);
    var digest = sha1.convert(bytes);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    Get.to(() => Userdetails());
  }
}
