// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_string.dart';
import '../../../controller/userdetails_controller.dart';
import '../../../models/userdetails_model.dart';

class Userdetailwidget extends StatefulWidget {
  const Userdetailwidget({super.key});

  @override
  State<Userdetailwidget> createState() => _UserdetailwidgetState();
}

class _UserdetailwidgetState extends State<Userdetailwidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserdetailsController());
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
              controller: controller.colab,
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
              controller: controller.service,
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
              controller: controller.post,
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
              controller: controller.video,
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
              controller: controller.story,
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

                    final userdetails = UserdetailsModel(
                      Colab: controller.colab.text.trim(),
                      Service: controller.service.text.trim(),
                      Post: controller.post.text.trim(),
                      Video: controller.video.text.trim(),
                      Story: controller.story.text.trim(),
                    );

                    UserdetailsController.instance
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
