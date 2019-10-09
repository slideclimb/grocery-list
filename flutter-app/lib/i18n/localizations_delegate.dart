import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/i18n/translations.dart';

class GroceryLocalizationsDelegate extends LocalizationsDelegate<Translations> {
  const GroceryLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'nl'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of Translations.
    return SynchronousFuture<Translations>(Translations(locale));
  }

  @override
  bool shouldReload(GroceryLocalizationsDelegate old) => false;
}
