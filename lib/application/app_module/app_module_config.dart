import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

abstract class AppModuleConfig {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget> _bindings;

  AppModuleConfig({
    required List<SingleChildWidget> bindings,
    required Map<String, WidgetBuilder> routers,
  })  : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers => _routers;
  List<SingleChildWidget> get bindings => _bindings;
}
