import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_ja.dart';

final Map<String, AppLocalizations> Locales = {
  'en': AppLocalizationsEn(),
  'ja': AppLocalizationsJa()
};

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en', '');
  Locale? get locale => _locale;

  Map<String, AppLocalizations> languages = {
    'en': AppLocalizationsEn(),
    'ja': AppLocalizationsJa()
  };

  List<Locale> all() {
    return [
      const Locale('en', ''),
      const Locale('ja', ''),
    ];
  }

  void setLocale(Locale locale) {
    if (!all().contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  AppLocalizations load() =>
      languages[_locale.languageCode] ?? AppLocalizationsEn();
}
