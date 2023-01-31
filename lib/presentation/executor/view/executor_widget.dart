import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_codding/cubit/upgradeable_cubit.dart';
import 'package:real_time_codding/presentation/executor/view/executor_view.dart';

class ExecutorWidget<TSource extends Cubit<String>, TTarget extends UpgradeableCubit<String>> extends StatelessWidget {
  final String function;
  final List<dynamic> args;

  const ExecutorWidget({
    super.key,
    this.function = '',
    this.args = const []
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ExecutorView<TSource, TTarget>(
        function: function,
        args: args,
      ),
    );
  }
}