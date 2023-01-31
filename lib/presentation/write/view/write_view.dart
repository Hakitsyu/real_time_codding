import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_codding/cubit/upgradeable_cubit.dart';

class WriteView<TCubit extends UpgradeableCubit<String>> extends StatelessWidget {
  static const int _maxLines = 20;

  const WriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: _maxLines,
        onChanged: (text) => context.read<TCubit>().update(text),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.purple
            )
          )
        ),
      ),
    );
  }

}