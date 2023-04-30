import 'package:b2b_exchange_development_version/features/Retailer/models/user_model.dart';
import 'package:b2b_exchange_development_version/repository/authentication_repository/authentication_repository.dart';
import 'package:b2b_exchange_development_version/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();



  //Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // Get user email and pass to UserRepository to fetch user record.
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;

    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  //fetch list of user records
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUsers();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
