import 'package:flutter/material.dart';

class Translations {
  Translations(this.locale);

  final Locale locale;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(
        context, Translations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Groceries',
      'new_grocery': 'Type here to add another grocery'
    },
    'nl': {
      'app_title': 'Boodschappen',
      'new_grocery': 'Type hier om een boodschap toe te voegen'
    }
  };

  String get appTitle {
    return _localizedValues[locale.languageCode]['app_title'];
  }

  String get newGrocery {
    return _localizedValues[locale.languageCode]['new_grocery'];
  }
}


