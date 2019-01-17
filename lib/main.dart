import 'package:flutter/material.dart';
import 'package:grocery_list/groceries.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grocery_list/translations.dart';
import 'package:grocery_list/localizations_delegate.dart';

void main() => runApp(GroceryApp());

/// Application class.
class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Groceries(), // Set the home route (page).
      debugShowCheckedModeBanner: false, // Disable debug banner.
      onGenerateTitle: (BuildContext context) => Translations.of(context).appTitle,
      localizationsDelegates: [
        const GroceryLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('nl')
      ],
    );
  }
}
