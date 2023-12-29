import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/size.dart';
import '../../../controller/dashboardclient_controller.dart';
import '../../../models/user_model.dart';

class Display_influ extends StatelessWidget {
  const Display_influ({
    super.key,
    required this.controlljob,
  });

  final DashboardClientcontroller controlljob;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(tDefaultSize),
      child: FutureBuilder<List<UserModel>>(
        future: controlljob.getAllUserModelData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (c, index) {
                  return Column(
                    children: [
                      SizedBox(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.blue.withOpacity(0.1),
                            leading: const Icon(LineAwesomeIcons.user_1),
                            title: Text(
                                "Name : ${snapshot.data![index].fullName}"),
                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "YouTube : ${snapshot.data![index].youtube}   "),
                                Text(
                                    "TikTok : ${snapshot.data![index].tiktok}   "),
                                Text(
                                    "Instagram : ${snapshot.data![index].insta}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              );
            } else {
              return Center(child: Text("something went wrong"));
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
