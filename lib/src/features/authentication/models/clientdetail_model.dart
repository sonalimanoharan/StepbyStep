import 'package:cloud_firestore/cloud_firestore.dart';

class ClientdetailsModel {
  final String? id;
  final String Product;
  final String Brand;
  final String Post;
  final String Video;
  final String Story;

  const ClientdetailsModel({
    this.id,
    required this.Product,
    required this.Brand,
    required this.Post,
    required this.Video,
    required this.Story,
  });

  toJson() {
    return {
      "Product_Name": Product,
      "Brand_Name": Brand,
      "Per post rate": Post,
      "Per video rate": Video,
      "Per story rate": Story,
    };
  }

  factory ClientdetailsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ClientdetailsModel(
        id: document.id,
        Product: data["Product_Name"],
        Brand: data["Brand_Name"],
        Post: data["Per post rate"],
        Video: data["Per video rate"],
        Story: data["Per story rate"]);
  }
}
