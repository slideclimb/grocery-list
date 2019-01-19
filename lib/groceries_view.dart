import 'package:flutter/material.dart';
import 'package:grocery_list/itemlist.dart';
import 'package:grocery_list/i18n/translations.dart';
import 'package:grocery_list/firestore_functions.dart';

/// Page with the grocery list.
class GroceriesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroceriesViewState();
}

/// State of [GroceriesView].
class GroceriesViewState extends State<GroceriesView> {
  /// Build the page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(Translations.of(context).appTitle),
          actions: <Widget>[
            // Button to clear the grocery list.
            new IconButton(
                icon: const Icon(Icons.delete), onPressed: clearGroceries)
          ],
        ),
        // Body of the page contains the list view with the groceries.
        // This is a stream with an async snapshot of the database, so it keeps
        // synchronised (it updates the ui when the database changes).
        body: new Column(children: <Widget>[
          ItemList(),
          TextField(
            // TODO Clear text field after submission, auto focus.
            // TODO Padding, background colour.
            decoration:
                InputDecoration(hintText: Translations.of(context).newGrocery),
            onSubmitted: addToFirestore,
          )
        ]));
  }
}
