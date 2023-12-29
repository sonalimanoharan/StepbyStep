import 'package:cloud_firestore/cloud_firestore.dart';

class UserdetailsModel {
  final String? id;
  final String Colab;
  final String Service;
  final String Post;
  final String Video;
  final String Story;

  const UserdetailsModel({
    this.id,
    required this.Colab,
    required this.Service,
    required this.Post,
    required this.Video,
    required this.Story,
  });

  toJson() {
    return {
      "Colaboration Brand": Colab,
      "Service Provided": Service,
      "Per post rate": Post,
      "Per video rate": Video,
      "Per story rate": Story,
    };
  }

  factory UserdetailsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserdetailsModel(
        id: document.id,
        Colab: data["Colaboration Brand"],
        Service: data["Service Provided"],
        Post: data["Per post rate"],
        Video: data["Per video rate"],
        Story: data["Per story rate"]);
  }
}
