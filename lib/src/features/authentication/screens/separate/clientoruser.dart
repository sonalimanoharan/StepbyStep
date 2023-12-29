import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/constants/text_string.dart';
import 'package:trail2/src/features/authentication/screens/dashboard_user%20copy/dashboard.dart';
import 'package:trail2/src/features/authentication/screens/phone_verification_screen/phone_verification_screen.dart';
import 'package:trail2/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:trail2/src/features/authentication/screens_client/phone_verification_screen/phone_verification_screen.dart';

import '../dashboard_client/dashboardclient.dart';
import '../dashboard_client/widgets/appbar.dart';

class clientuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Join as Client or Influenzer"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 200.0,
                        height: 300.0,
                        child: Expanded(
                            child: OutlinedButton(
                                onPressed: () =>
                                    Get.to(() => PhonenoVerifyScreenClient()),
                                child: Text(clientbutton.toUpperCase()))),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 200.0,
                        height: 300.0,
                        child: Expanded(
                            child: ElevatedButton(
                                onPressed: () =>
                                    Get.to(() => PhonenoVerifyScreen()),
                                child: Text(userbutton.toUpperCase()))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
