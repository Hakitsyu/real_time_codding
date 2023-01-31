import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_codding/cubit/upgradeable_cubit.dart';
import 'package:real_time_codding/presentation/write/view/code_write_view.dart';
import 'package:real_time_codding/presentation/write/view/dart_write_view.dart';
import 'package:real_time_codding/presentation/write/view/write_view.dart';

// ignore: must_be_immutable
class WriteWidget<TCubit extends UpgradeableCubit<String>> extends StatelessWidget {
  final String text;

  const WriteWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return DartWriteView<TCubit>(text: text);
  }
}