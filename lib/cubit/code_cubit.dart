
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_codding/cubit/upgradeable_cubit.dart';

class CodeCubit extends UpgradeableCubit<String> {
  CodeCubit({String? defaultValue}) : super(defaultValue ?? '');
}