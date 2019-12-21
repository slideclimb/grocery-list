import 'package:cloud_firestore/cloud_firestore.dart';

/// Updates the done property of a grocery in the firestore database.
void updateFirestore(DocumentSnapshot document, bool value) async {
    await Firestore.instance
        .collection('groceries')
        .document(document.documentID)
        .updateData({'done': value});
}

/// Adds a new grocery to the firestore database.
void addToFirestore(String text) => Firestore.instance
    .collection('groceries')
    .document()
    .setData({'item': text, 'done': false});

/// Clears the list of groceries in firestore.
void clearGroceries() {
  Firestore.instance.collection('groceries').getDocuments().then((snapshot) {
    for (DocumentSnapshot ds in snapshot.documents) {
      ds.reference.delete();
    }
  });
}
