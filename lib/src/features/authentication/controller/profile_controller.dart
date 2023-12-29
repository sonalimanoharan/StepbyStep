import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/users_repository/users_repository.dart';

import '../models/user_model.dart';

class UpdateProfileController extends GetxController {
  static UpdateProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  getUserModelData() {
    final phone = _authRepo.firebaseUser.value?.phoneNumber;
    final maa = _authRepo.firebaseUser.value?.uid;
    print(maa);
    if (phone != null) {
      return _userRepo.getUserModelprofile(phone);
    } else {
      Get.snackbar("error", "Login to continue");
    }
  }

  updateUserModelData(UserModel user) async {
    await _userRepo.updateUserModelprofile(user);
  }
}
