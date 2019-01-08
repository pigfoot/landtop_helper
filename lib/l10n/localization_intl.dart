import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class L10N {
  static Future<L10N> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new L10N();
    });
  }

  static L10N of(BuildContext context) {
    return Localizations.of<L10N>(context, L10N);
  }

  static final L10N instance = new L10N();

  String get appName => Intl.message("Landtop", name: "appName");
}
