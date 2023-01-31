import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highlight/languages/dart.dart';
import 'package:real_time_codding/cubit/upgradeable_cubit.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:real_time_codding/presentation/executor/view/executor_widget.dart';
import 'package:real_time_codding/presentation/write/view/dart_write_view.dart';

// ignore: must_be_immutable
class DefaultDartWriteView<TSource extends UpgradeableCubit<String>, TTarget extends UpgradeableCubit<String>> extends StatelessWidget {
  static const String _text = '''
Map<String, dynamic>? render() {
  return null;
}
''';
  static const String _function = 'render';

  const DefaultDartWriteView({ super.key });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          DartWriteView<TSource>(text: _text),
          ExecutorWidget<TSource, TTarget>(function: _function)
        ],
      ),
    );
  }
}