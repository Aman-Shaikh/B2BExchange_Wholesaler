import 'package:b2b_exchange_development_version/features/Retailer/screens/Dashboard/dashborad.dart';
import 'package:b2b_exchange_development_version/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  //this function should be called from otp_screen
  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const DashboardScreen()) : Get.back();
  }


}