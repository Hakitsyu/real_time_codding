import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/code_runner.dart';
import '../../../cubit/upgradeable_cubit.dart';

class ExecutorView<TSource extends Cubit<String>, TTarget extends UpgradeableCubit<String>> extends StatelessWidget {
  final String function;
  final List<dynamic> args;

  const ExecutorView({
    super.key,
    this.function = '',
    this.args = const []
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        final source = context.read<TSource>();
        final codeRunner = context.read<CodeRunner>();
        final result = codeRunner.run(source.state, function: function, args: args);
        if (result == null)
          return;

        context.read<TTarget>().update(jsonEncode(result));
      }, 
      child: const Text('Execute')
    );
  }  
}