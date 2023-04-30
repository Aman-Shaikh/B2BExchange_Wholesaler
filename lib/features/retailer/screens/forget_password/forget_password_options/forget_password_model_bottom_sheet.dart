
import 'package:b2b_exchange_development_version/constants/sizes.dart';
import 'package:b2b_exchange_development_version/constants/text_strings.dart';
import 'package:b2b_exchange_development_version/features/Retailer/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:b2b_exchange_development_version/features/Retailer/screens/forget_password/forget_password_options/forget_password_mail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(myDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(myForgetPasswordTitle,
                style: Theme.of(context).textTheme.headline3),
            Text(myForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 30.0),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              title: myEmail,
              subTitle: myResetViaEMail,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              onTap: () {},
              title: myPhoneNo,
              subTitle: myResetViaPhone,
              btnIcon: Icons.mobile_friendly_rounded,
            ),
          ],
        ),
      ),
    );
  }
}