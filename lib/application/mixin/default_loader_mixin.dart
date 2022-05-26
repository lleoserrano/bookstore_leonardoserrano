import 'package:flutter/material.dart';

import '../../components/loader/loader_app.dart';
import '../constants/app_constants.dart';

mixin DefaultLoaderMixin {
  bool _dialogIsOpen = false;
  void showLoader(BuildContext context) async {
    if (_dialogIsOpen) {
      hideLoader(context);
    }
    _dialogIsOpen = true;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const LoaderApp(),
    );
  }

  void hideLoader(BuildContext context) {
    if (_dialogIsOpen) {
      ScaffoldMessenger.of(AppConstants.homeScaffoldKey.currentContext!)
          .clearSnackBars();
      Navigator.pop(context);
    }

    _dialogIsOpen = false;
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(AppConstants.homeScaffoldKey.currentContext!)
        .clearSnackBars();
    ScaffoldMessenger.of(AppConstants.homeScaffoldKey.currentContext!)
        .showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
