// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/models/user_model.dart';
import 'package:trail2/src/features/authentication/screens/dashboard_client/dashboardclient.dart';
import 'package:trail2/src/features/authentication/screens/dashboard_user%20copy/dashboard.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/users_repository/users_repository.dart';

import '../models/userdetails_model.dart';
import '../screens/forgot_password/forgot_password_otp/otp_screen.dart';

class UserdetailsController extends GetxController {
  static UserdetailsController get instance => Get.find();
  final colab = TextEditingController();
  final service = TextEditingController();
  final post = TextEditingController();
  final video = TextEditingController();
  final story = TextEditingController();

  final userdetalisRepo = Get.put(UserRepository());

  Future<void> createUserdetails(UserdetailsModel userdetails) async {
    await userdetalisRepo.createUserdetails(userdetails);
    Get.to(Dashboardclient());
  }
}
