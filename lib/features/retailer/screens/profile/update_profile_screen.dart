import 'package:b2b_exchange_development_version/constants/colors.dart';
import 'package:b2b_exchange_development_version/constants/image_strings.dart';
import 'package:b2b_exchange_development_version/constants/sizes.dart';
import 'package:b2b_exchange_development_version/constants/text_strings.dart';
import 'package:b2b_exchange_development_version/features/Retailer/controllers/profile_controller.dart';
import 'package:b2b_exchange_development_version/features/Retailer/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Center(
            child: Text(myEditProfile,
                style: Theme.of(context).textTheme.headline5)),
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
                  final password =
                      TextEditingController(text: userData.password);
                  final fullName =
                      TextEditingController(text: userData.fullName);
                  final phoneNo = TextEditingController(text: userData.phoneNo);

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
                                  LineAwesomeIcons.camera,
                                  color: Colors.black,
                                  size: 20,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: fullName,
                              decoration: const InputDecoration(
                                  label: Text(myFullName),
                                  prefixIcon:
                                      Icon(Icons.person_outline_rounded)),
                            ),
                            const SizedBox(height: myFormHeight - 20),
                            TextFormField(
                              controller: email,
                              decoration: const InputDecoration(
                                  label: Text(myEmail),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            const SizedBox(height: myFormHeight - 20),
                            TextFormField(
                              controller: phoneNo,
                              decoration: const InputDecoration(
                                  label: Text(myPhoneNo),
                                  prefixIcon: Icon(Icons.numbers)),
                            ),
                            const SizedBox(height: myFormHeight - 20),
                            TextFormField(
                              controller: password,
                              decoration: const InputDecoration(
                                  label: Text(myPassword),
                                  prefixIcon: Icon(Icons.fingerprint)),
                            ),
                            const SizedBox(height: myFormHeight - 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final user = UserModel(
                                      id: userData.id,
                                      email: email.text.trim(),
                                      password: password.text.trim(),
                                      fullName: fullName.text.trim(),
                                      phoneNo: phoneNo.text.trim());

                                  await controller.updateRecord(user);
                                  Get.snackbar("Success", "Your account has been Edited successfully.",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.green.withOpacity(0.1),
                                      colorText: Colors.green);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: myPrimaryColor,
                                    shape: const StadiumBorder(),
                                    side: BorderSide.none,
                                    foregroundColor: Colors.black),
                                child: Text(myEditProfile.toUpperCase()),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(TextSpan(
                                    text: myJoinedAt,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12))),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.1),
                                      elevation: 0,
                                      foregroundColor: Colors.red,
                                      shape: const StadiumBorder(),
                                      side: BorderSide.none),
                                  child: const Text(myDelete),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
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
