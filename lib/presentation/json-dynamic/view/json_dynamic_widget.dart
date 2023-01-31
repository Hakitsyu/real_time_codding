import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:real_time_codding/cubit/upgradeable_cubit.dart';
import 'package:real_time_codding/presentation/json-dynamic/view/json_dynamic_view.dart';

class JsonDynamicWidget<TCubit extends UpgradeableCubit<String>> extends StatelessWidget {
  JsonWidgetRegistry registry;

  JsonDynamicWidget({
    super.key,
    required this.registry
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TCubit, String>(
      builder: (context, state) {
        return JsonDynamicView(content: state, registry: registry);
      }
    );
  }
}