import 'dart:convert';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highlight/languages/json.dart';
import 'package:real_time_codding/application/code_runner.dart';
import 'package:real_time_codding/cubit/upgradeable_cubit.dart';
import 'package:flutter_highlight/themes/darcula.dart';

class CodeWriteView<TCubit extends UpgradeableCubit<String>> extends StatelessWidget {
  final int maxLines;
  final CodeController codeController;

  const CodeWriteView({
    super.key,
    required this.codeController,
    this.maxLines = 30,
  });

  @override
  Widget build(BuildContext context) {
    context.read<TCubit>().update(codeController.text);

    return Center(
      child: CodeTheme(
        data: const CodeThemeData(styles: darculaTheme),
        child: CodeField(
          keyboardType: TextInputType.multiline,
          maxLines: maxLines,
          onChanged: (text) => context.read<TCubit>().update(text),
          controller: codeController,
        )
      )
    );
  }
}