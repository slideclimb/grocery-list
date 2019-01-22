import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/firestore_functions.dart';
import 'package:firestore_ui/animated_firestore_list.dart';

/// List of the items in the firestore database.
///
/// This is synced to the database, and (immediately) redraws the ui on an update.
/// For every grocery it shows the 'item' as text, and the 'done' as a checkbox.
class ItemList extends StatefulWidget {
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
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
            // Wrap the [AnimatedList] in an [Expanded] so it takes all available
            // vertical space.
            return new Expanded(
                child: new Scrollbar(
                    child: new FirestoreAnimatedList(
              query: Firestore.instance.collection('groceries').snapshots(),
              duration: Duration(seconds: 1),
              itemBuilder: (BuildContext context, DocumentSnapshot snapshot,
                  Animation animation, int index) {
                return FadeTransition(
                  opacity: animation,
                  child: CheckboxListTile(
                    value: snapshot['done'],
                    title: new Text(snapshot['item']),
                    onChanged: (value) {
                      updateFirestore(snapshot, value);
                    }));
              },
            )));
        }
      },
    );
  }
}
