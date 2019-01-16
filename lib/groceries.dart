import 'package:flutter/material.dart';
import 'package:grocery_list/grocery.dart';

/// Page with the grocery list.
class Groceries extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroceriesState();
}

/// State of [Groceries].
class GroceriesState extends State<Groceries> {
  /// List of current groceries.
  final _groceries = <Grocery>[];

  /// Build the page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Boodschappen'),
          actions: <Widget>[
            // Button to clear the grocery list.
            new IconButton(
                icon: const Icon(Icons.delete), onPressed: _clearGroceries)
          ],
        ),
        // Body of the page contains the list view with the groceries.
        body: new ListView.builder(itemBuilder: (context, i) {
          // Display a grocery.
          if (i < _groceries.length) {
            return CheckboxListTile(
              title: Text(_groceries[i].name),
              value: _groceries[i].done,  // Whether or not the grocery is done.
              onChanged: (bool value) {
                // setState redraws all the ui elements.
                setState(() {
                  _groceries[i].done = value;
                });
              },
            );
          } else if (i == _groceries.length) {
            // Add an element to the bottom of the list we use to add new
            // groceries. By default of TextField, an element is added when
            // hitting enter.
            return ListTile(
                title: TextField(
              autofocus: true,
              onSubmitted: _addGrocery,
              decoration: InputDecoration(hintText: 'nieuwe boodschap'),
            ));
          }
        }));
  }

  /// Adds a grocery to the list of groceries and redraws the ui.
  void _addGrocery(String text) {
    setState(() {
      _groceries.add(Grocery(false, text));
    });
  }

  /// Clears the list of groceries and redraws the ui.
  void _clearGroceries() {
    setState(() {
      _groceries.clear();
    });
  }
}
