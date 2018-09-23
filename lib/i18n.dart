import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class L {
  // ------------------------------- FIELDS -------------------------------

  /// Language.
  static String _language = 'ms';

  /// Locale.
  static Locale _locale = Locale(_language);

  /// Language change stream.
  static BehaviorSubject<String> _languageChangeStream = BehaviorSubject<String>(seedValue: _language);

  // ----------------------------- PROPERTIES -----------------------------

  ///
  /// Gets list of supported locales.
  ///
  static List<Locale> get supportedLocales {
    return <Locale>[
      Locale('ms', ''),
      Locale('en', ''),
    ];
  }

  ///
  /// Stream that can be used to listen to, to be notified when language is changed.
  ///
  static BehaviorSubject<String> get languageChangeStream {
    return _languageChangeStream;
  }

  // ------------------------------- METHODS ------------------------------

  ///
  /// Gets the localised text of given [key].
  ///
  static String get(String key) {
    if (_localisationData.containsKey(key)) {
      final _LE entry = _localisationData[key];
      return _extractText(entry.data);
    }

    return key;
  }

  ///
  /// Change to another language given by [newLanguage].
  ///
  static void changeLanguage(String newLanguage) {
    _language = newLanguage;
    _locale = Locale(newLanguage);
    _languageChangeStream.add(newLanguage);
  }

  ///
  /// Extract localised string for current locale.
  ///
  static String _extractText(Map<String, String> map) {
    if (map.containsKey(_language)) {
      return map[_language];
    } else if (map.containsKey(_locale.languageCode)) {
      return map[_locale.languageCode];
    } else {
      return map['ms'];
    }
  }
}

///
/// Single entry for localisation data.
///
class _LE {
  // ------------------------------- FIELDS -------------------------------

  /// Localisation data.
  final Map<String, String> data;

  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create new [_LE].
  ///
  const _LE({this.data});
}

///
/// Contains all localised texts.
///
Map<String, _LE> _localisationData = <String, _LE>{
  'Flutter Custom Localisation Test': const _LE(
      data: <String, String>{
        'en': 'Flutter Custom Localisation Test',
        'ms': 'Cubaan Lokalisasi Sendiri Flutter'
      }
  ),
  'Custom Localisation Test': const _LE(
      data: <String, String>{
        'en': 'Custom Localisation Test',
        'ms': 'Cubaan Lokalisasi Sendiri'
      }
  ),
  'This is English': const _LE(
      data: <String, String>{
        'en': 'This is English',
        'ms': 'Ini adalah Bahasa Melayu'
      }
  ),
  'CHANGE LANGUAGE': const _LE(
      data: <String, String>{
        'en': 'CHANGE LANGUAGE',
        'ms': 'TUKAR BAHASA'
      }
  ),
};
