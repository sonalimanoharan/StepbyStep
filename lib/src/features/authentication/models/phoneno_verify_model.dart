import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhonenoModel {
  final String? id;
  final String phoneNo;
  const PhonenoModel({
    this.id,
    required this.phoneNo,
  });

  toJson() {
    return {
      "Phone_Number": phoneNo,
    };
  }
}
