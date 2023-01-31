import 'package:dart_eval/dart_eval.dart';

T? cast<T>(x) => x is T ? x : null;

abstract class CodeRunner<T> {
  T? run(String code, { String function = '', List<dynamic> args = const [] });
}

class DefaultCodeRunner<T> extends CodeRunner<T> {
  @override
  T? run(String code, { String function = '', List<dynamic> args = const [] }) {
    return cast<T>(eval(code, function: function, args: args));
  }
} 