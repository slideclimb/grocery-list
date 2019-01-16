import 'package:flutter/material.dart';
import 'package:grocery_list/grocery.dart';

class Groceries extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroceriesState();
}

class GroceriesState extends State<Groceries> {
  final _groceries = <Grocery>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Boodschappen'),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.delete), onPressed: _clearGroceries)
          ],
        ),
        body: new ListView.builder(itemBuilder: (context, i) {
          if (i < _groceries.length) {
            return CheckboxListTile(
              title: Text(_groceries[i].name),
              value: _groceries[i].done,
              onChanged: (bool value) {
                setState(() {
                  _groceries[i].done = value;
                });
              },
            );
          } else if (i == _groceries.length) {
            return ListTile(
                title: TextField(
              autofocus: true,
              onSubmitted: _addGrocery,
              decoration: InputDecoration(hintText: 'nieuwe boodschap'),
            ));
          }
        }));
  }

  void _addGrocery(String text) {
    setState(() {
      _groceries.add(Grocery(false, text));
    });
  }

  void _clearGroceries() {
    setState(() {
      _groceries.clear();
    });
  }
}
