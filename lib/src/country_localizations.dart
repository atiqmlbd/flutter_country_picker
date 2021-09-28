import 'dart:html';

import 'package:country_picker/src/res/strings/ar.dart';
import 'package:country_picker/src/res/strings/hr.dart';
import 'package:flutter/material.dart';

import 'res/strings/cn.dart';
import 'res/strings/en.dart';
import 'res/strings/es.dart';
import 'res/strings/gr.dart';
import 'res/strings/nb.dart';
import 'res/strings/nn.dart';
import 'res/strings/np.dart';
import 'res/strings/pl.dart';
import 'res/strings/pt.dart';
import 'res/strings/ru.dart';
import 'res/strings/tr.dart';
import 'res/strings/tw.dart';
import 'res/strings/uk.dart';

class CountryLocalizations {
  final Locale locale;
  final String Function(String locale)? callBack;

  CountryLocalizations(this.locale, {this.callBack});

  /// The `CountryLocalizations` from the closest [Localizations] instance
  /// that encloses the given context.
  ///
  /// This method is just a convenient shorthand for:
  /// `Localizations.of<CountryLocalizations>(context, CountryLocalizations)`.
  ///
  /// References to the localized resources defined by this class are typically
  /// written in terms of this method. For example:
  ///
  /// ```dart
  /// CountryLocalizations.of(context).countryName(countryCode: country.countryCode),
  /// ```
  static CountryLocalizations? of(BuildContext context) {
    return Localizations.of<CountryLocalizations>(
      context,
      CountryLocalizations,
    );
  }

  /// A [LocalizationsDelegate] that uses [_CountryLocalizationsDelegate.load]
  /// to create an instance of this class.
  static const LocalizationsDelegate<CountryLocalizations> delegate =
      _CountryLocalizationsDelegate();

  static LocalizationsDelegate<CountryLocalizations> callBackDelegate(
      {required String Function(String locale)? callBack}) {
    return _CountryLocalizationsDelegate(callBack: callBack);
  }

  /// The localized country name for the given country code.
  String? countryName({required String countryCode}) {
    if (callBack != null) {
      return callBack?.call(countryCode);
    }
    switch (locale.languageCode) {
      case 'zh':
        switch (locale.scriptCode) {
          case 'Hant':
            return tw[countryCode];
          case 'Hans':
          default:
            return cn[countryCode];
        }
      case 'el':
        return gr[countryCode];
      case 'es':
        return es[countryCode];
      case 'pt':
        return pt[countryCode];
      case 'nb':
        return nb[countryCode];
      case 'nn':
        return nn[countryCode];
      case 'uk':
        return uk[countryCode];
      case 'pl':
        return pl[countryCode];
      case 'tr':
        return tr[countryCode];
      case 'ru':
        return ru[countryCode];
      case 'hi':
      case 'ne':
        return np[countryCode];
      case 'ar':
        return ar[countryCode];
      case 'hr':
        return hr[countryCode];
      case 'en':
      default:
        return en[countryCode];
    }
  }
}

class _CountryLocalizationsDelegate
    extends LocalizationsDelegate<CountryLocalizations> {
  final String Function(String locale)? callBack;

  const _CountryLocalizationsDelegate({this.callBack});

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'ar',
      'zh',
      'el',
      'es',
      'pl',
      'pt',
      'nb',
      'nn',
      'ru',
      'uk',
      'hi',
      'ne',
      'tr',
      'hr',
      'nl',
    ].contains(locale.languageCode);
  }

  @override
  Future<CountryLocalizations> load(Locale locale) {
    final CountryLocalizations localizations =
        CountryLocalizations(locale, callBack: callBack);
    return Future.value(localizations);
  }

  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}
