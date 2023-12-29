// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:trail2/src/features/authentication/controller_client/dashboardclient_controller.dart';
import 'package:trail2/src/features/authentication/models/client_model.dart';

import '../../../../../constants/size.dart';
import '../../../controller/dashboardclient_controller.dart';
import '../../../models/user_model.dart';

class Description_ScreenClient extends StatelessWidget {
  const Description_ScreenClient({
    super.key,
    required this.controlljob,
  });

  final DashboardUsercontrollerClient controlljob;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(tDefaultSize),
      child: FutureBuilder<List<ClientModel>>(
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
                                "Name : ${snapshot.data![index].ClientName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].Clientemail),
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
