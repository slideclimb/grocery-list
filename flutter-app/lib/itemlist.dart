import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/firestore_functions.dart';

/// List of the items in the firestore database.
///
/// This is synced to the database, and (immediately) redraws the ui on an update.
/// For every grocery it shows the 'item' as text, and the 'done' as a checkbox.
class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('groceries').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new CircularProgressIndicator();
          default:
            // Wrap the [ListView] in an [Expanded] so it takes all available
            // vertical space.
            return new Expanded(
                child: new Scrollbar(
                    child: new ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = snapshot.data.documents[index];
                        return new CheckboxListTile(
                            value: document['done'],
                            title: new Text(document['item']),
                            onChanged: (value) {
                              updateFirestore(document, value);
                            });
                      },
            )));
        }
      },
    );
  }
}
