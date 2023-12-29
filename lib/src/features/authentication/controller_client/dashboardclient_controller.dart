import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/models/client_model.dart';
import 'package:trail2/src/features/authentication/models/user_model.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/repository/users_repository/users_repository.dart';
import 'package:trail2/src/repository/users_repository_client/users_repository.dart';

class DashboardUsercontrollerClient extends GetxController {
  static DashboardUsercontrollerClient get instance => Get.find();

  final _userRepo = Get.put(UserRepositoryClient());
  Future<List<ClientModel>> getAllUserModelData() {
    return _userRepo.getAllUserModel();
  }
}
