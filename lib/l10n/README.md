## Reference
https://flutter.io/docs/development/accessibility-and-localization/internationalization

### Howto
Rebuilding l10n/messages_all.dart requires two steps.

1. With the app’s root directory as the current directory, generate lib/l10n/intl_messages.arb from lib/l10n/strings.dart:

```
flutter packages pub run intl_translation:extract_to_arb \
    --output-dir=lib/l10n \
    lib/l10n/localization_intl.dart
```

The intl_messages.arb file is a JSON format map with one entry for each Intl.message() function defined in main.dart. This file serves as a template for the English and Spanish translations, intl_en.arb and intl_es.arb. These translations are created by you, the developer.

2. With the app’s root directory as the current directory, generate intl_messages_<locale>.dart for each intl_<locale>.arb file and intl_messages_all.dart, which imports all of the messages files:

```
flutter packages pub run intl_translation:generate_from_arb \
    --output-dir=lib/l10n \
    --no-use-deferred-loading \
    lib/l10n/localization_intl.dart lib/l10n/l10n_*.arb
```
The DemoLocalizations class uses the generated initializeMessages() function (defined in intl_messages_all.dart) to load the localized messages and Intl.message() to look them up.

