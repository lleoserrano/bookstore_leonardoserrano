import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderApp extends StatelessWidget {
  const LoaderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .1,
          height: MediaQuery.of(context).size.width * .1,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Platform.isIOS
              ? const CupertinoActivityIndicator(
                  color: Colors.black,
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
