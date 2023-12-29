import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../constants/size.dart';
import '../dashboard_client/widgets/appbar.dart';

class UserDetailDisplayScreenClient extends StatefulWidget {
  const UserDetailDisplayScreenClient({super.key, this.data});
  final QueryDocumentSnapshot<Object?>? data;
  @override
  State<UserDetailDisplayScreenClient> createState() =>
      _UserDetailDisplayScreenStateClient();
}

class _UserDetailDisplayScreenStateClient
    extends State<UserDetailDisplayScreenClient> {
  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
    final subCollectionsQuery = firestoreInstance
        .collection('Users')
        .where('FullName', isEqualTo: 'avina');

    return Scaffold(
      appBar: DashboardAppBarClient(),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Name"),
                      Text(widget.data!.get("FullName"))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Phone Number"),
                      Text(widget.data!.get("Phone_Number"))
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: subCollectionsQuery.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading...');
                      }
                      final documents = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          final subCollectionName = documents[index].id;
                          return StreamBuilder<QuerySnapshot>(
                            stream: firestoreInstance
                                .collection('Users')
                                .doc(subCollectionName)
                                .collection('work')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text('Loading...');
                              }
                              final subDocuments = snapshot.data!.docs;
                              final subCollectionFields = subDocuments
                                  .map((document) => document.data().toString())
                                  .toList();
                              return Column(
                                children: [
                                  Text(subCollectionName),
                                  ...subCollectionFields
                                      .map((field) => Text(field)),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
