import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/models/client_model.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/authentication_repository_client/authentication_repository.dart';
import 'package:trail2/src/repository/users_repository/users_repository.dart';
import 'package:trail2/src/repository/users_repository_client/users_repository.dart';

import '../models/user_model.dart';

class UpdateProfileControllerClient extends GetxController {
  static UpdateProfileControllerClient get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepositoryClient());
  final _userRepo = Get.put(UserRepositoryClient());
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

  updateUserModelData(ClientModel user) async {
    await _userRepo.updateUserModelprofile(user);
  }
}
