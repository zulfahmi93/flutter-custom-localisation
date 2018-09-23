import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_custom_l10n/i18n.dart';
import 'package:flutter_custom_l10n/pages_home.dart';

///
/// App.
///
class MyApp extends StatefulWidget {
  // ------------------------------- METHODS ------------------------------

  ///
  /// Creates state for this widget.
  ///
  @override
  _MyAppState createState() => _MyAppState();
}

///
/// State for [MyApp].
///
class _MyAppState extends State<MyApp> {
  // ------------------------------- FIELDS -------------------------------

  /// App language.
  String _currentLanguage;

  /// App locale.
  Locale _currentLocale;

  /// Language changed stream subscription.
  StreamSubscription<String> _sub;

  // ------------------------------- METHODS ------------------------------

  ///
  /// Invoked when this widget is inserted into view tree.
  ///
  @override
  void initState() {
    super.initState();
    if (_currentLanguage == null) {
      _currentLanguage = 'ms';
    }

    if (_currentLocale == null) {
      _currentLocale = Locale(_currentLanguage);
    }

    _sub = L.languageChangeStream.listen(_onLanguageChanged);
  }

  ///
  /// Invoked when this widget is destroyed.
  ///
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  ///
  /// Builds this widget.
  ///
  @override
  Widget build(BuildContext context) {
    //
    // App root.
    return MaterialApp(
      //
      // Localisation delegates.
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      //
      // Supported locales.
      supportedLocales: L.supportedLocales,
      //
      // Locale.
      locale: _currentLocale,
      //
      // Application title which will be shown by OS task switcher.
      onGenerateTitle: (BuildContext context) => L.get('Flutter Custom Localisation Test'),
      //
      // Application theme.
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          accentColor: Colors.white),
      //
      // Application starting page.
      home: HomePage(),
    );
  }

  ///
  /// Invoked when language changed.
  ///
  void _onLanguageChanged(String newLanguage) {
    setState(() {
      _currentLanguage = newLanguage;
      _currentLocale = Locale(newLanguage);
    });
  }
}

