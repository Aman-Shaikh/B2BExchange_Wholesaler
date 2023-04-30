import 'package:b2b_exchange_development_version/constants/colors.dart';
import 'package:b2b_exchange_development_version/constants/image_strings.dart';
import 'package:b2b_exchange_development_version/constants/sizes.dart';
import 'package:b2b_exchange_development_version/constants/text_strings.dart';
import 'package:b2b_exchange_development_version/features/Retailer/controllers/profile_controller.dart';
import 'package:b2b_exchange_development_version/features/Retailer/models/user_model.dart';
import 'package:b2b_exchange_development_version/features/Retailer/screens/profile/profile_menu_widget.dart';
import 'package:b2b_exchange_development_version/features/Retailer/screens/profile/update_profile_screen.dart';
import 'package:b2b_exchange_development_version/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Center(
            child:
                Text(myProfile, style: Theme.of(context).textTheme.headline5)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(myDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;

                  //TextField Controllers to get data from TextFields
                  final email = TextEditingController(text: userData.email);
                  final fullName =
                      TextEditingController(text: userData.fullName);

                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image(
                                    image:
                                        AssetImage(myShopingBasketWithPhone))),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: myPrimaryColor,
                                ),
                                child: const Icon(
                                  LineAwesomeIcons.alternate_pencil,
                                  color: Colors.black,
                                  size: 20,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(fullName.text,
                          style: Theme.of(context).textTheme.headline4),
                      Text(email.text,
                          style: Theme.of(context).textTheme.bodyText2),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => UpdateProfileScreen()),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: myPrimaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text(myEditProfile,
                              style: TextStyle(color: myDarkColor)),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 10),

                      // MENU
                      ProfileMenuWidget(
                          title: "Settings",
                          icon: LineAwesomeIcons.cog,
                          onPress: () {}),
                      ProfileMenuWidget(
                          title: "Billing Details",
                          icon: LineAwesomeIcons.wallet,
                          onPress: () {}),
                      ProfileMenuWidget(
                          title: "User Management",
                          icon: LineAwesomeIcons.user_check,
                          onPress: () {}),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10),
                      ProfileMenuWidget(
                          title: "Information",
                          icon: LineAwesomeIcons.info,
                          onPress: () {}),
                      ProfileMenuWidget(
                          title: "LogOut",
                          icon: LineAwesomeIcons.alternate_sign_out,
                          textColor: Colors.red,
                          onPress: () {
                            AuthenticationRepository.instance.logOut();
                            Get.snackbar("Success", "you are logged out successfully.",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green.withOpacity(0.1),
                                colorText: Colors.green);
                          }),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text("Something went wrong"));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
