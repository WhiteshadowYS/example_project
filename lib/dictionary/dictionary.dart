import 'package:flutter/material.dart';
import 'package:example_project/dictionary/en.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

import 'doctionary_keys.dart';

class FlutterDictionary {
  final Locale locale;

  FlutterDictionary(this.locale);

  static FlutterDictionary of(BuildContext context) {
    return Localizations.of<FlutterDictionary>(context, FlutterDictionary);
  }

  static Map<String, Map<DictionaryKeys, String>> _localizedValues = {'en': EN};

  String get getLoginPageTitle          => _localizedValues[locale.languageCode][DictionaryKeys.login_page_title];
  String get getLoginPageEmailHint      => _localizedValues[locale.languageCode][DictionaryKeys.login_page_email];
  String get getLoginPageEmailError     => _localizedValues[locale.languageCode][DictionaryKeys.login_page_email_is_not_correct];
  String get getLoginPagePasswordHint   => _localizedValues[locale.languageCode][DictionaryKeys.login_page_password];
  String get getLoginPagePasswordError  => _localizedValues[locale.languageCode][DictionaryKeys.login_page_password_is_to_short];
  String get getLoginPageSignInButton   => _localizedValues[locale.languageCode][DictionaryKeys.login_page_login_button];

  String get getHomePageTitle           => _localizedValues[locale.languageCode][DictionaryKeys.home_page_title];
  String get getHomePageSignOut         => _localizedValues[locale.languageCode][DictionaryKeys.home_page_sign_out_button];

  String getByKey(DictionaryKeys key) => _localizedValues[locale.languageCode][key];

  static const List<String> _rtlLanguages = <String>[
    'ar', // Arabic
    'fa', // Farsi
    'he', // Hebrew
    'ps', // Pashto
    'ur', // Urdu
  ];

  static bool isRTL(BuildContext context) {
    return _rtlLanguages.contains(Localizations.localeOf(context).languageCode);
  }
}

class FlutterDictionaryDelegate extends LocalizationsDelegate<FlutterDictionary> {
  const FlutterDictionaryDelegate();

  ///locales added here are supported by the dictionary, but not yet by the app
  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<FlutterDictionary> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<FlutterDictionary>(FlutterDictionary(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<FlutterDictionary> old) {
    return false;
  }
}
