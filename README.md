[![Build Status](https://travis-ci.com/slideclimb/grocery-list.svg?branch=master)](https://travis-ci.com/slideclimb/grocery-list)
# Grocery List

Keep track of your family's groceries.

This is a project to try out [Flutter](https://flutter.io).

## I18n
Used an [example](https://github.com/flutter/website/blob/master/src/_includes/code/internationalization/minimal/main.dart) from flutter.
To add a new translation:

- Add it to the `_localizedValues` map in `translations.dart`.
- Create a getter, e.g. 

```dart
    String get title {
      return _localizedValues[locale.languageCode]['title'];
    }
```

- Use this string with

```dart
    Translations.of(context).title;
```
