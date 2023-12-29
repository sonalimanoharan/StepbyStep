// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/constants/size.dart';
import 'package:trail2/src/constants/text_string.dart';
import 'package:trail2/src/features/authentication/controller_client/phoneno_verify_controller.dart';
import 'package:trail2/src/features/authentication/models/phoneno_verify_model.dart';
import '../../controller/phoneno_verify_controller.dart';
import '../../controller/signup_controller.dart';

class PhonenoVerifyScreenClient extends StatefulWidget {
  const PhonenoVerifyScreenClient({Key? key}) : super(key: key);

  @override
  State<PhonenoVerifyScreenClient> createState() =>
      _PhonenoVerifyScreenStateClient();
}

class _PhonenoVerifyScreenStateClient extends State<PhonenoVerifyScreenClient> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhonenoControllerClient());
    final _formkey = GlobalKey<FormState>();
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Form(
                    key: _formkey,
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'formate +911234567890';
                                }
                                return null;
                              },
                              controller: controller.phoneno,
                              decoration: const InputDecoration(
                                label: Text(tPhoneNo),
                                prefixIcon: Icon(Icons.numbers),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    // SignUpController.instance.RegisterUser(controller.email.text.trim(),controller.password.text.trim(),);

                                    final user = PhonenoModel(
                                      phoneNo: controller.phoneno.text.trim(),
                                    );

                                    PhonenoController.instance
                                        .verifyUser(user);
                                  }
                                },
                                child: Text(tSignup.toUpperCase()),
                              ),
                            )
                          ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
