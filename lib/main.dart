import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:provider/provider.dart';
import 'package:real_time_codding/application/code_runner.dart';
import 'package:real_time_codding/cubit/code_cubit.dart';
import 'package:real_time_codding/cubit/json_cubit.dart';
import 'package:real_time_codding/cubit/upgradeable_cubit.dart';
import 'package:real_time_codding/presentation/executor/view/executor_widget.dart';
import 'package:real_time_codding/presentation/json-dynamic/view/json_dynamic_widget.dart';
import 'package:real_time_codding/presentation/write/view/default_dart_write_view.dart';
import 'package:real_time_codding/presentation/write/view/write_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Real Time Codding';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: const Color(0xff2b2b2b),
        ),
        body: Body()
      )
    );
  }
}

typedef Create<T> = T Function(BuildContext context);

// ignore: must_be_immutable
class Body extends StatelessWidget {
  final JsonWidgetRegistry _registry = JsonWidgetRegistry.instance;

  Body({ super.key });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CodeRunner>(create: (_) => DefaultCodeRunner()),
        BlocProvider<JsonCubit>(create: (_) => JsonCubit()),
        BlocProvider<CodeCubit>(create: (_) => CodeCubit())
      ],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const DefaultDartWriteView<CodeCubit, JsonCubit>(),
            JsonDynamicWidget<JsonCubit>(registry: _registry),
          ],
        ),
      )
    );
  }

}