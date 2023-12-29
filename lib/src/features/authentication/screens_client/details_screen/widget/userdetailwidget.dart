// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/controller_client/userdetails_controller.dart';
import 'package:trail2/src/features/authentication/models/clientdetail_model.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_string.dart';
import '../../../controller/userdetails_controller.dart';
import '../../../models/userdetails_model.dart';

class UserdetailwidgetClient extends StatefulWidget {
  const UserdetailwidgetClient({super.key});

  @override
  State<UserdetailwidgetClient> createState() => _UserdetailwidgetStateClient();
}

class _UserdetailwidgetStateClient extends State<UserdetailwidgetClient> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserdetailsControllerClient());
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
              controller: controller.Product,
              decoration: const InputDecoration(
                label: Text(tcolab),
                prefixIcon: Icon(Icons.person_outline_rounded),
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
              controller: controller.Brand,
              decoration: const InputDecoration(
                label: Text(tservice),
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
              controller: controller.Post,
              decoration: const InputDecoration(
                label: Text(tpost),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            Text(trate),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.Video,
              decoration: const InputDecoration(
                label: Text(tvideo),
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
              controller: controller.Story,
              decoration: const InputDecoration(
                label: Text(tstory),
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

                    final userdetails = ClientdetailsModel(
                      Product: controller.Product.text.trim(),
                      Brand: controller.Brand.text.trim(),
                      Post: controller.Post.text.trim(),
                      Video: controller.Video.text.trim(),
                      Story: controller.Story.text.trim(),
                    );

                    UserdetailsControllerClient.instance
                        .createUserdetails(userdetails);
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
