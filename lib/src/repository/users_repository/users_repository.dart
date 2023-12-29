// ignore_for_file: unused_field, prefer_function_declarations_over_variables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/models/user_model.dart';
import '../../features/authentication/models/userdetails_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  String? userid = FirebaseAuth.instance.currentUser?.uid;

  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    var result = await _db
        .collection("Users")
        .doc(userid)
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
        .collection("Users")
        .where("Phone_Number", isEqualTo: phone)
        .get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUserModelprofile(UserModel user) async {
    await _db
        .collection("Users")
        .doc(userid)
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
        FirebaseFirestore.instance.collection('Users').doc(userid);
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

  Future<List<UserModel>> getAllUserModel() async {
    final snapshot = await _db.collection("Users").get();
    final UserModelData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return UserModelData;
  }

  Future<String?> createUserdetails(UserdetailsModel userdetails) async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    print(uid);
    await _db
        .collection("Users")
        .doc(userid)
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
