// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grocery_list/main.dart';

void main() {
  testWidgets('appelflap', (WidgetTester tester) async {

    // Build our app and trigger a frame.
    await tester.pumpWidget(GroceryApp());
    // Wait for the keyboard to come up.
    await tester.pump(Duration(microseconds: 500));
    await tester.enterText(find.byType(TextField), 'appelflap\n');
    await tester.pump();
    // Verify that 'appelflap' is still on the screen.
    expect(find.text('appelflap'), findsOneWidget);
    // Verify by that there is a ListTile on the screen.
    // This implies that 'appelflap' must be on the tile.
    expect(find.byType(CheckboxListTile), findsOneWidget);
  });
}
