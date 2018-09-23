import 'package:flutter/material.dart';
import 'package:flutter_custom_l10n/i18n.dart';

class HomePage extends StatelessWidget {
  // ------------------------------- METHODS ------------------------------

  ///
  /// Builds this widget.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  ///
  /// Builds the app bar.
  ///
  Widget _buildAppBar() {
    return AppBar(
        title: Text(
            L.get('Custom Localisation Test')
        )
    );
  }

  ///
  /// Builds the scaffold body.
  ///
  Widget _buildBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //
          // Language text.
          Text(
            L.get('This is English'),
            style: TextStyle(
              fontSize: 16.0
            ),
          ),
          //
          // Change language button.
          RaisedButton(
            onPressed: _changeLanguage,
            child: Text(L.get('CHANGE LANGUAGE')),
          )
        ],
      ),
    );
  }

  ///
  /// Toggle between malay anf english language.
  ///
  void _changeLanguage() {
    final String language = L.languageChangeStream.value;
    if (language == 'ms') {
      L.changeLanguage('en');
    } else {
      L.changeLanguage('ms');
    }
  }
}
