import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/models/user_model.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/users_repository/users_repository.dart';

class DashboardClientcontroller extends GetxController {
  static DashboardClientcontroller get instance => Get.find();

  final _userRepo = Get.put(UserRepository());
  Future<List<UserModel>> getAllUserModelData() {
    return _userRepo.getAllUserModel();
  }
}
