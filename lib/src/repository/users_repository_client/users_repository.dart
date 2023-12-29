// ignore_for_file: unused_field, prefer_function_declarations_over_variables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/src/features/authentication/models/client_model.dart';
import 'package:trail2/src/features/authentication/models/clientdetail_model.dart';

import '../../features/authentication/models/user_model.dart';
import '../../features/authentication/models/userdetails_model.dart';

class UserRepositoryClient extends GetxController {
  static UserRepositoryClient get instance => Get.find();
  String? userid = FirebaseAuth.instance.currentUser?.uid;

  final _db = FirebaseFirestore.instance;
  createUser(ClientModel user) async {
    var result = await _db
        .collection("Clients")
        .doc("useruid")
        .set(user.toJson())
        .whenComplete(
      () {
        Get.snackbar(
          "Success",
          "your account is created",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      },
    ).catchError(
      (error, stackTrace) {
        Get.snackbar(
          "error",
          "something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
        print(error.toString());
      },
    );
  }

  Future<UserModel> getUserModelprofile(String phone) async {
    final snapshot = await _db
        .collection("Clients")
        .where("Phone_Number", isEqualTo: phone)
        .get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUserModelprofile(ClientModel user) async {
    await _db
        .collection("Clients")
        .doc("useruid")
        .update(user.toJson())
        .whenComplete(
      () {
        Get.snackbar(
          "Success",
          "your account is updated",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      },
    ).catchError(
      (error, stackTrace) {
        Get.snackbar(
          "error",
          "something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
        print(error.toString());
      },
    );
  }

  Future<void> deleteCollection() async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('Clients').doc("userid");
    docRef.delete().whenComplete(
      () {
        Get.snackbar(
          "Success",
          "your account is delected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      },
    ).catchError(
      (error, stackTrace) {
        Get.snackbar(
          "error",
          "something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
        print(error.toString());
      },
    );
  }

  Future<List<ClientModel>> getAllUserModel() async {
    final snapshot = await _db.collection("Clients").get();
    final UserModelData =
        snapshot.docs.map((e) => ClientModel.fromSnapshot(e)).toList();
    return UserModelData;
  }

  Future<String?> createUserdetails(ClientdetailsModel userdetails) async {
    await _db
        .collection("Users")
        .doc("userid")
        .collection("work")
        .add(userdetails.toJson())
        .whenComplete(
      () {
        Get.snackbar(
          "Success",
          "your account is created",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      },
    ).catchError(
      (error, stackTrace) {
        Get.snackbar(
          "error",
          "something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
        print(error.toString());
      },
    );
  }

  Future<List<UserdetailsModel>> getAllUserjobModel() async {
    final snapshotdetail = await _db.collection("Users").get();
    final UserdetailsModelData = snapshotdetail.docs
        .map((e) => UserdetailsModel.fromSnapshot(e))
        .toList();
    return UserdetailsModelData;
  }
}
