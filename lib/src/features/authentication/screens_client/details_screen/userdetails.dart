// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trail2/src/constants/text_string.dart';
import 'package:trail2/src/features/authentication/screens/details_screen/widget/userdetailwidget.dart';
import 'package:trail2/src/features/authentication/screens_client/details_screen/widget/userdetailwidget.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/image_string.dart';
import '../../../../constants/size.dart';

class UserdetailsClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FormHeaderWidget(
                    image: twelcomeImage,
                    title: tskilstitle,
                    subtitle: tskills),
                UserdetailwidgetClient(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
