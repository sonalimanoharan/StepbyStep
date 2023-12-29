import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:trail2/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:trail2/src/features/authentication/screens/profile/updateprofile_screen.dart';

import '../userdetaildisplay_screen/userdetails_display_screen.dart';

class SearchScreen extends SearchDelegate {
  final CollectionReference _firebasefirestore =
      FirebaseFirestore.instance.collection("Users");

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return StreamBuilder(
      stream: _firebasefirestore.snapshots().asBroadcastStream(),
      builder: ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.data!.docs
              .where((QueryDocumentSnapshot<Object?> element) =>
                  element["FullName"]
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()))
              .isEmpty) {
            return Center(
              child: Text(
                "no such profile found",
              ),
            );
          }
          return ListView(
            children: [
              ...snapshot.data!.docs
                  .where((QueryDocumentSnapshot<Object?> element) =>
                      element["FullName"]
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                  .map((QueryDocumentSnapshot<Object?> data) {
                final String fullName = data.get('FullName');
                // final String phoneno = data.get('Phone_Number');
                final String email = data.get('Email');
//\.then((QuerySnapshot querySnapshot) {

//
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserDetailDisplayScreen(
                                data: data,
                              )),
                    );
                  },
                  title: Text(fullName),
                  subtitle: Text(email),
                  leading: Icon(LineAwesomeIcons.user_1),
                );
              })
            ],
          );
        }
      }),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(
      child: Text("search something"),
    );
    throw UnimplementedError();
  }
}
