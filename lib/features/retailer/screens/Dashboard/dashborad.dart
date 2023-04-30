import 'package:b2b_exchange_development_version/constants/colors.dart';
import 'package:b2b_exchange_development_version/constants/image_strings.dart';
import 'package:b2b_exchange_development_version/constants/text_strings.dart';
import 'package:b2b_exchange_development_version/features/Retailer/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            //For Dark Color
            color: isDark ? myWhiteColor : myDarkColor,
          ),
          title: Text(myAppName, style: Theme.of(context).textTheme.headline4),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //For Dark Color
                color: isDark ? mySecondaryColor : myCardBgColor,
              ),
              child: IconButton(onPressed: () {Get.to( () => const ProfileScreen());}, icon: const Image(image: AssetImage(myShopingBasketWithPhone))),
            )
          ],
        ),

        body:Center(child: Text("Home Screen",style: Theme.of(context).textTheme.headline3,)),
      ),
    );
  }
}