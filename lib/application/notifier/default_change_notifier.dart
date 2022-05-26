import 'package:flutter/material.dart';

import '../../models/exception/abstract_exception.dart';

class DefaultChangeNotifier extends ChangeNotifier {
  bool _loading = false;
  String? _error;
  bool _success = false;

  bool get loading => _loading;
  String? get error => _error;
  bool get hasError => _error != null;
  bool get isSuccess => _success;

  void showLoading() {
    _loading = true;
  }

  void hideLoading() {
    _loading = false;
  }

  void success() {
    _success = true;
  }

  void setError(Exception? error) {
    _error = _errorType(error);
  }

  void showLoadingAndResetState() {
    showLoading();
    resetState();
  }

  void resetState() {
    setError(null);
    _success = false;
  }

  String? _errorType(Exception? error) {
    if (error is AbstractException) {
      return error.messageUserView;
    }
    return error?.toString();
  }
}
