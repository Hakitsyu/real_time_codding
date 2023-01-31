import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highlight/languages/dart.dart';
import 'package:real_time_codding/cubit/upgradeable_cubit.dart';
import 'package:flutter_highlight/themes/darcula.dart';

import 'code_write_view.dart';

// ignore: must_be_immutable
class DartWriteView<TCubit extends UpgradeableCubit<String>> extends StatelessWidget {
  static const String _defaultText = '''
void main() {
  print('hello world')
}
''';
  static const String _defaultFunction = 'main';

  final String text;
  late CodeController _controller;

  DartWriteView({
    super.key,
    this.text = _defaultText,
  }) {
    _controller = CodeController(
      language: dart,
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CodeWriteView<TCubit>(
      codeController: _controller,
    );
  }
}