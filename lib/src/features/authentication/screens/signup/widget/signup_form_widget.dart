// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/controller/signup_controller.dart';
import 'package:trail2/src/features/authentication/models/user_model.dart';
import 'package:trail2/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_string.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
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
              controller: controller.fullname,
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
              controller: controller.email,
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
              controller: controller.phoneno,
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
              controller: controller.password,
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
              controller: controller.youtube,
              decoration: const InputDecoration(
                label: Text("YouTube Followers"),
                prefixIcon: Icon(Icons.thumb_up),
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
              controller: controller.youtubelink,
              decoration: const InputDecoration(
                label: Text("YouTube Account Link"),
                prefixIcon: Icon(Icons.link),
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
              controller: controller.tiktok,
              decoration: const InputDecoration(
                label: Text("TikTok Followers"),
                prefixIcon: Icon(Icons.thumb_up),
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
              controller: controller.tiktoklink,
              decoration: const InputDecoration(
                label: Text("TikTok Account Link"),
                prefixIcon: Icon(Icons.link),
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
              controller: controller.insta,
              decoration: const InputDecoration(
                label: Text("Instagram Followers"),
                prefixIcon: Icon(Icons.thumb_up),
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
              controller: controller.instalink,
              decoration: const InputDecoration(
                label: Text("Instagram account Link"),
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

                    final user = UserModel(
                      fullName: controller.fullname.text.trim(),
                      email: controller.email.text.trim(),
                      phoneNo: controller.phoneno.text.trim(),
                      password: controller.password.text.trim(),
                      youtube: controller.youtube.text.trim(),
                      youtubelink: controller.youtubelink.text.trim(),
                      tiktok: controller.tiktok.text.trim(),
                      tiktoklink: controller.tiktoklink.text.trim(),
                      insta: controller.insta.text.trim(),
                      instalink: controller.instalink.text.trim(),
                    );

                    SignUpController.instance.createUser(user);
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
