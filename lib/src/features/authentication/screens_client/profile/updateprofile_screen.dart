// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:trail2/src/features/authentication/controller/profiledelete_controller.dart';
import 'package:trail2/src/features/authentication/controller_client/profile_controller.dart';
import 'package:trail2/src/features/authentication/controller_client/profiledelete_controller.dart';
import 'package:trail2/src/features/authentication/models/client_model.dart';
import 'package:trail2/src/features/authentication/models/user_model.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_string.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_string.dart';
import '../../controller/profile_controller.dart';

class UpdateProfileScreenClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(UpdateProfileControllerClient());
    final controllerd = Get.put(DeleteProfileControllerClient());

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
          child: FutureBuilder(
            future: controller.getUserModelData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  ClientModel usermodelprofiledata =
                      snapshot.data as ClientModel;
                  final ClientName = TextEditingController(
                      text: usermodelprofiledata.ClientName);
                  final Clientemail = TextEditingController(
                      text: usermodelprofiledata.Clientemail);
                  final ClientphoneNo = TextEditingController(
                      text: usermodelprofiledata.Clientprof);
                  final Clientprof = TextEditingController(
                      text: usermodelprofiledata.Clientprof);
                  final Clientorg = TextEditingController(
                      text: usermodelprofiledata.Clientorg);
                  final Clientpassword = TextEditingController(
                      text: usermodelprofiledata.Clientpassword);
                  final Clientbusi = TextEditingController(
                      text: usermodelprofiledata.Clientbusi);
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(
                                    image: AssetImage(twelcomeImage))),
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
                                LineAwesomeIcons.camera,
                                color: Colors.black,
                                size: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: ClientName,
                              //initialValue: usermodelprofiledata.fullName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text(tFullName),
                                prefixIcon: Icon(Icons.person_outline_rounded),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: Clientemail,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              // initialValue: usermodelprofiledata.email,
                              decoration: const InputDecoration(
                                label: Text(tEmail),
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: ClientphoneNo,
                              //initialValue: usermodelprofiledata.phoneNo,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text(tPhoneNo),
                                prefixIcon: Icon(Icons.numbers),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: Clientprof,
                              //initialValue: usermodelprofiledata.password,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text(tPassword),
                                prefixIcon: Icon(Icons.fingerprint),
                                suffixIcon: Icon(Icons.remove_red_eye_sharp),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 10),
                            TextFormField(
                              controller: Clientorg,
                              //initialValue: usermodelprofiledata.phoneNo,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text(tPhoneNo),
                                prefixIcon: Icon(Icons.numbers),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: Clientpassword,
                              //initialValue: usermodelprofiledata.phoneNo,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text("YouTube Followers"),
                                prefixIcon: Icon(Icons.numbers),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: Clientbusi,
                              //initialValue: usermodelprofiledata.phoneNo,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text("YouTube Account Link"),
                                prefixIcon: Icon(Icons.numbers),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final userData = ClientModel(
                                    ClientName: ClientName.text.trim(),
                                    Clientemail: Clientemail.text.trim(),
                                    ClientphoneNo: ClientphoneNo.text.trim(),
                                    Clientprof: Clientprof.text.trim(),
                                    Clientorg: Clientorg.text.trim(),
                                    Clientpassword: Clientpassword.text.trim(),
                                    Clientbusi: Clientbusi.text.trim(),
                                  );
                                  await controller
                                      .updateUserModelData(userData);
                                },
                                child: Text(tEditProfile.toUpperCase()),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: tRemoveProfile,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    await controllerd.deleteUserModelData();
                                  },
                                  child: Text("Delete"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                    elevation: 0,
                                    foregroundColor: Colors.red,
                                    shape: StadiumBorder(),
                                    side: BorderSide.none,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(child: Text("something went wrong"));
                }
              } else {
                return (Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ),
      ),
    );
  }
}
