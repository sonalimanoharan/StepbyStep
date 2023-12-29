import 'package:cloud_firestore/cloud_firestore.dart';

class ClientModel {
  final String? id;
  final String ClientName;
  final String Clientemail;
  final String ClientphoneNo;
  final String Clientprof;
  final String Clientorg;
  final String Clientpassword;
  final String Clientbusi;

  const ClientModel({
    this.id,
    required this.ClientName,
    required this.Clientemail,
    required this.ClientphoneNo,
    required this.Clientorg,
    required this.Clientprof,
    required this.Clientpassword,
    required this.Clientbusi,
  });

  toJson() {
    return {
      "ClientFullName": ClientName,
      "Organization": Clientorg,
      "Profession": Clientprof,
      "Email": Clientemail,
      "Phone_Number": ClientphoneNo,
      "Password": Clientpassword,
      "Business_link": Clientbusi,
    };
  }

  factory ClientModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ClientModel(
        id: document.id,
        ClientName: data["ClientFullName"],
        Clientorg: data["Organization"],
        Clientprof: data["Profession"],
        Clientemail: data["Email"],
        ClientphoneNo: data["Phone_Number"],
        Clientpassword: data["Password"],
        Clientbusi: data["Business_link"]);
  }
}
