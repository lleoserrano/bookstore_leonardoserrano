import 'package:flutter/material.dart';

mixin DefaultScrollMixin<T extends StatefulWidget> on State<T> {
  final _scrollController = ScrollController();
  VoidCallback? _onEndScroll;
  ScrollController get scrollController => _scrollController;
  set setScrollCallEnd(VoidCallback value) => _onEndScroll = value;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _onEndScroll?.call();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    _scrollController.dispose();
    super.dispose();
  }
}
