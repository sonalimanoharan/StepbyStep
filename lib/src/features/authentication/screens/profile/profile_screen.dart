// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:trail2/src/constants/colors.dart';
import 'package:trail2/src/features/authentication/screens/profile/updateprofile_screen.dart';
import 'package:trail2/src/features/authentication/screens/profile/widgets/profilemenu_screen.dart';
import '../../../../constants/image_string.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_string.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // ignore: prefer_const_constructors
        leading: IconButton(
          icon: Icon(LineAwesomeIcons.angle_left),
          onPressed: () {},
        ),
        title:
            Text(tAppName, style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //For Dark Color
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDashboard),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(twelcomeImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: tPrimaryColor,
                      ),
                      child: Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 10,
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),
              Text(
                tProfileHeading,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                tProfileSubHeading,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(tEditProfile,
                      style: TextStyle(color: tDarkColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              ///menu
              ProfileMenuList(
                title: 'Settings',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuList(
                title: 'Home',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuList(
                title: 'About',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuList(
                title: 'Payment',
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              ProfileMenuList(
                title: 'Logout',
                textColor: Colors.red,
                endIcon: false,
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
