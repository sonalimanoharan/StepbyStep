// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/size.dart';
import '../../../../../constants/text_string.dart';
import '../../forgot_password/forgot_password_options/forgot_password_showmodelbottomsheet.dart';

class LoginFormClient extends StatefulWidget {
  const LoginFormClient({
    super.key,
  });

  @override
  State<LoginFormClient> createState() => _LoginFormStateClient();
}

class _LoginFormStateClient extends State<LoginFormClient> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: tFormHeight - 10.0),
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
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    labelText: tEmail,
                    hintText: tEmail,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: tFormHeight,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: tFormHeight - 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ForgotPasswordsScreenClient
                        .Forgotpasswordshowmodelbottomsheet(context);
                  },
                  child: Text(tForgotPassword),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text(tlogintitle.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
