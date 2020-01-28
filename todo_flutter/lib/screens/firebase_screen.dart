import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

 
class FireBaseScreen extends StatelessWidget {
   


  get databaseReference {
    return Firestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStore Demo'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('Create Record'),
            onPressed: () {
              createRecord();
            },
          ),
          RaisedButton(
            child: Text('View Record'),
            onPressed: () {
              getData();
            },
          ),
          RaisedButton(
            child: Text('Update Record'),
            onPressed: () {
              updateData();
            },
          ),
          RaisedButton(
            child: Text('Delete Record'),
            onPressed: () {
              deleteData();
            },
          ),
        ],
      )), //center
    );
  }

  void createRecord() async {
    await databaseReference.collection("tasks")
        .document("1")
        .setData({
          'title': 'Mastering Flutter',
          'details': 'Programming Guide for Dart',
          'date': '01/01/2020',
          'completed': false
        });

    DocumentReference ref = await databaseReference.collection("tasks")
        .add({
          'title': 'Flutter in Action',
          'details': 'Complete Programming Guide to learn Flutter','date': '01/01/2020',
          'completed': false
        });
    print(ref.documentID);
  }

  void getData() {
    databaseReference
        .collection("tasks")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

  void updateData() {
    try {
      databaseReference
          .collection('tasks')
          .document('1')
          .updateData({'details': 'Head First Flutter'});
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData() {
    try {
      databaseReference
          .collection('tasks')
          .document('1')
          .delete();
    } catch (e) {
      print(e.toString());
    }
   }
}