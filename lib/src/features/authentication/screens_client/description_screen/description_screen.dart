import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/controller_client/dashboardclient_controller.dart';
import 'package:trail2/src/features/authentication/screens_client/description_screen/widget/nep_screen.dart';

class Display_influClient extends StatelessWidget {
  const Display_influClient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controlljob = Get.put(DashboardUsercontrollerClient());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Description_ScreenClient(controlljob: controlljob)],
        ),
      ),
    );
  }
}
