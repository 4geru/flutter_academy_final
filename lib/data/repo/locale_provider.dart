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

  void setLocale(Locale locale) {
    if (!Locales.keys.contains(locale.languageCode)) return;
    _locale = locale;
    notifyListeners();
  }

  AppLocalizations load() =>
      Locales[_locale.languageCode] ?? AppLocalizationsEn();
}
