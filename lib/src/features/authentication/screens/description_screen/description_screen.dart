import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/screens/description_screen/widget/nep_screen.dart';

import '../../controller/dashboardclient_controller.dart';

class Display_influ extends StatelessWidget {
  const Display_influ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controlljob = Get.put(DashboardClientcontroller());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Description_Screen(controlljob: controlljob)],
        ),
      ),
    );
  }
}
