import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/firestore_functions.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('groceries').snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new Expanded(child: new ListView(
              children: snapshot.data.documents
                  .map((DocumentSnapshot document) {
                return new CheckboxListTile(
                  title: new Text(document['item']),
                  value: document['done'],
                  onChanged: (value) {
                    updateFirestore(document, value);
                  },
                );
              }).toList(),
            ));
        }
      },
    );
  }
}