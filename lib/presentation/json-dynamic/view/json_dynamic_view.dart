import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

// ignore: must_be_immutable
class JsonDynamicView extends StatelessWidget {
  static const _invalidText = 'Invalid content';

  String content;
  JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

  JsonDynamicView({
    super.key, 
    JsonWidgetRegistry? registry,
    required this.content,
  }) {
    if (registry != null)
      this.registry = registry;
  }

  @override
  Widget build(BuildContext context) {
    try {
      final JsonWidgetData? data = JsonWidgetData.fromDynamic(jsonDecode(content), registry: registry);
      return data != null ? data.build(context: context) : _createInvalidWidget();        
    } catch(ex) {
      return _createInvalidWidget();
    }
  }

  Widget _createInvalidWidget() => const Text(_invalidText);
}