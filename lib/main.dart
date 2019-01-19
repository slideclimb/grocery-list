import 'package:flutter/material.dart';
import 'package:grocery_list/groceries_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grocery_list/i18n/translations.dart';
import 'package:grocery_list/i18n/localizations_delegate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  Firestore.instance.settings(timestampsInSnapshotsEnabled: true);
  runApp(GroceryApp());
}

/// Application class.
class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroceriesView(),
      // Set the home route (page).
      debugShowCheckedModeBanner: false,
      // Disable debug banner.
      onGenerateTitle: (BuildContext context) =>
          Translations.of(context).appTitle,
      localizationsDelegates: [
        const GroceryLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('nl')],
    );
  }
}
