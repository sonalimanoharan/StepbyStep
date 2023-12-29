// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/models/client_model.dart';
import 'package:trail2/src/features/authentication/models/user_model.dart';
import 'package:trail2/src/features/authentication/screens/dashboard_client/dashboardclient.dart';
import 'package:trail2/src/features/authentication/screens/details_screen/userdetails.dart';
import 'package:trail2/src/features/authentication/screens_client/dashboard_client/dashboardclient.dart';
import 'package:trail2/src/features/authentication/screens_client/details_screen/userdetails.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/authentication_repository_client/authentication_repository.dart';
import 'package:trail2/src/repository/users_repository/users_repository.dart';
import 'package:trail2/src/repository/users_repository_client/users_repository.dart';

import '../screens/forgot_password/forgot_password_otp/otp_screen.dart';

class SignUpControllerClient extends GetxController {
  static SignUpControllerClient get instance => Get.find();
  final ClientName = TextEditingController();
  final Clientemail = TextEditingController();
  final ClientphoneNo = TextEditingController();
  final Clientorg = TextEditingController();
  final Clientprof = TextEditingController();
  final Clientpassword = TextEditingController();
  final Clientbusi = TextEditingController();

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

  encoding() {
    var bytes = utf8.encode(Clientpassword.text);
    var digest = sha1.convert(bytes);
  }

  Future<void> createUser(ClientModel user) async {
    await userRepo.createUser(user);
    Get.to(() => Dashboardclient());
  }
}
