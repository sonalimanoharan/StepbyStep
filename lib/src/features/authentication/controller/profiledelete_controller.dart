import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/users_repository/users_repository.dart';

import '../models/user_model.dart';

class DeleteProfileController extends GetxController {
  static DeleteProfileController get instance => Get.find();

  final _userRepo = Get.put(UserRepository());

  deleteUserModelData() async {
    await _userRepo.deleteCollection();
    Get.to(() => const WelcomeScreen());
  }
}
