import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UpgradeableCubit<T> extends Cubit<T> {
  UpgradeableCubit(super.initialState);

  update(T value) => emit(value);
}