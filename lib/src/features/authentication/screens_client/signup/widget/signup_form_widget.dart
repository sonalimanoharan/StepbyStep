// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/controller/signup_controller.dart';
import 'package:trail2/src/features/authentication/controller_client/signup_controller.dart';
import 'package:trail2/src/features/authentication/models/client_model.dart';
import 'package:trail2/src/features/authentication/models/user_model.dart';
import 'package:trail2/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_string.dart';

class SignUpFormWidgetClient extends StatefulWidget {
  const SignUpFormWidgetClient({
    super.key,
  });

  @override
  State<SignUpFormWidgetClient> createState() => _SignUpFormWidgetStateClient();
}

class _SignUpFormWidgetStateClient extends State<SignUpFormWidgetClient> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpControllerClient());
    final _formkey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.ClientName,
              decoration: const InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Invalid email format';
                }
                return null;
              },
              controller: controller.Clientemail,
              decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.ClientphoneNo,
              decoration: const InputDecoration(
                label: Text(tPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.Clientorg,
              decoration: const InputDecoration(
                label: Text("Organization"),
                prefixIcon: Icon(Icons.business),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.Clientprof,
              decoration: const InputDecoration(
                label: Text("Profession"),
                prefixIcon: Icon(Icons.supervised_user_circle),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.Clientpassword,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  label: Text(tPassword),
                  prefixIcon: Icon(Icons.fingerprint),
                  suffixIcon: IconButton(
                    onPressed: (() {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    }),
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                  )
                  // icon: Icon(Icons.remove_red_eye_sharp),
                  ),
            ),
            const SizedBox(height: tFormHeight - 10),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.Clientbusi,
              decoration: const InputDecoration(
                label: Text("Business http link"),
                prefixIcon: Icon(Icons.link),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    // SignUpController.instance.RegisterUser(controller.email.text.trim(),controller.password.text.trim(),);

                    final user = ClientModel(
                      ClientName: controller.ClientName.text.trim(),
                      Clientemail: controller.Clientemail.text.trim(),
                      ClientphoneNo: controller.ClientphoneNo.text.trim(),
                      Clientorg: controller.Clientorg.text.trim(),
                      Clientprof: controller.Clientprof.text.trim(),
                      Clientpassword: controller.Clientpassword.text.trim(),
                      Clientbusi: controller.Clientbusi.text.trim(),
                    );

                    SignUpControllerClient.instance.createUser(user);
                  }
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
