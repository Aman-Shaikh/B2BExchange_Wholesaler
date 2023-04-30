import 'package:b2b_exchange_development_version/constants/image_strings.dart';
import 'package:b2b_exchange_development_version/constants/sizes.dart';
import 'package:b2b_exchange_development_version/constants/text_strings.dart';
import 'package:b2b_exchange_development_version/features/Retailer/controllers/login_controller.dart';
import 'package:b2b_exchange_development_version/features/Retailer/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: myFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(myGoogleLogo), width: 20.0),
            onPressed: () {
              LoginController.instance.loginUserWithGoogle();
            },
            label: const Text(mySignInWithGoogle),
          ),
        ),
        const SizedBox(height: myFormHeight - 20),
        TextButton(
          onPressed: () {
            Get.offAll(const SignUpScreen());
          },
          child: Text.rich(
            TextSpan(
                text: myDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(text: mySignup, style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}