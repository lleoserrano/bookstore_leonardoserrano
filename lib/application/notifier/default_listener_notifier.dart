import 'package:flutter/material.dart';

import '../mixin/default_loader_mixin.dart';
import 'default_change_notifier.dart';

class DefaultListenerNotifier with DefaultLoaderMixin {
  final DefaultChangeNotifier changeNotifier;

  DefaultListenerNotifier({
    required this.changeNotifier,
  });

  void listener(
      {required BuildContext context,
      required SuccessVoidCallback successCallback,
      EverVoidCallback? everCallback,
      ErrorVoidCallback? errorCallback}) {
    changeNotifier.addListener(() {
      if (everCallback != null) {
        everCallback(changeNotifier, this);
      }
      if (changeNotifier.loading) {
        showLoader(context);
      } else {
        hideLoader(context);
      }

      if (changeNotifier.hasError) {
        if (errorCallback != null) {
          errorCallback(changeNotifier, this);
        }
        showMessage( changeNotifier.error ?? 'Sorry, Internal error.');
      } else if (changeNotifier.isSuccess) {
        successCallback(changeNotifier, this);
      }
    });
  }

  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

typedef SuccessVoidCallback = void Function(
    DefaultChangeNotifier notifier, DefaultListenerNotifier listenerInstance);

typedef ErrorVoidCallback = void Function(
    DefaultChangeNotifier notifier, DefaultListenerNotifier listenerInstance);

typedef EverVoidCallback = void Function(
    DefaultChangeNotifier notifier, DefaultListenerNotifier listenerInstance);
