import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';
import '../../profile/profile_screen.dart';

class DashboardAppBarClient extends StatelessWidget
    implements PreferredSizeWidget {
  const DashboardAppBarClient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      // ignore: prefer_const_constructors
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text(tAppName, style: Theme.of(context).textTheme.headlineMedium),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          child: IconButton(
            iconSize: 50,
            onPressed: () => Get.to(() => ProfileScreenClient()),
            icon: const Image(image: AssetImage(tSplashImage)),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
