import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final String youtube;
  final String youtubelink;
  final String tiktok;
  final String tiktoklink;
  final String insta;
  final String instalink;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.youtube,
    required this.youtubelink,
    required this.tiktok,
    required this.tiktoklink,
    required this.insta,
    required this.instalink,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone_Number": phoneNo,
      "Password": password,
      "YouTube_Followers": youtube,
      "YouTube_Account_Link": youtubelink,
      "TikTok_Followers": tiktok,
      "TikTok_Account_Link": tiktoklink,
      "Instagram_Followers": insta,
      "Instagram_account_Link": instalink,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["FullName"],
        email: data["Email"],
        phoneNo: data["Phone_Number"],
        password: data["Password"],
        youtube: data["YouTube_Followers"],
        youtubelink: data["YouTube_Account_Link"],
        tiktok: data["TikTok_Followers"],
        tiktoklink: data["TikTok_Account_Link"],
        insta: data["Instagram_Followers"],
        instalink: data["Instagram_account_Link"]);
  }
}
