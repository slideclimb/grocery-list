import 'package:flutter/material.dart';
import 'package:grocery_list/firestore_functions.dart';
import 'package:grocery_list/i18n/translations.dart';

Card groceryTextField(BuildContext context) {
  /// _focusnode is needed to focus the text field after a submission.
  final FocusNode _focusNode = new FocusNode();

  /// _controller is needed to clear the text field after a submission.
  final TextEditingController _controller = new TextEditingController();

  return Card(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            cursorColor: Theme.of(context).primaryColor,
            cursorWidth: 1.0,
            decoration:
                InputDecoration(hintText: Translations.of(context).newGrocery),
            onSubmitted: (text) {
              addToFirestore(text);
              FocusScope.of(context).requestFocus(_focusNode); // Re-focus.
              _controller.clear(); // Clear text.
            },
          )));
}
