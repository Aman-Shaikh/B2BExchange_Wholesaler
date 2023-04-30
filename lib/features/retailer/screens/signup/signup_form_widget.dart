import 'package:b2b_exchange_development_version/constants/sizes.dart';
import 'package:b2b_exchange_development_version/constants/text_strings.dart';
import 'package:b2b_exchange_development_version/features/Retailer/controllers/signup_controller.dart';
import 'package:b2b_exchange_development_version/features/Retailer/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: myFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                  label: Text(myFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height: myFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  label: Text(myEmail), prefixIcon: Icon(Icons.email_outlined)),
            ),
            // const SizedBox(height: myFormHeight - 20),
            // TextFormField(
            //   controller: controller.phoneNo,
            //   decoration: const InputDecoration(
            //       label: Text(myPhoneNo), prefixIcon: Icon(Icons.numbers)),
            // ),
            const SizedBox(height: myFormHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                  label: Text(myPassword), prefixIcon: Icon(Icons.fingerprint)),
            ),
            const SizedBox(height: myFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    //for email verifacation
                    // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                    //for phone verifacation
                    // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                    // Get.to(()=> const OTPScreen());

                    // to add user in database and perform signup authentication after that
                    // final user = UserModel(email: controller.email.text.trim(), password: controller.password.text.trim(), fullName: controller.fullName.text.trim(), phoneNo: controller.phoneNo.text.trim());
                    // SignUpController.instance.createUser(user);

                    final user = UserModel(email: controller.email.text.trim(), password: controller.password.text.trim(), fullName: controller.fullName.text.trim());
                    SignUpController.instance.registerUser(user);

                  }
                },
                child: Text(mySignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}