String pageTemplate = '''
import 'package:%{package}/res/R.dart';
import 'package:%{package}/src/page/%{nameSnake}/%{nameSnake}_cubit.dart';
import 'package:%{package}/src/page/%{nameSnake}/%{nameSnake}_state.dart';   
import 'package:aware_event/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class %{name}Page extends StatefulWidget {
  const %{name}Page({
    Key? key,
  }) : super(key: key);

  @override
  %{name}State createState() => %{name}State();
}

class %{name}State extends State<%{name}Page> {
  late %{name}Cubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = %{name}Cubit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return %{name}Page();
  }
}
''';

String cubitTemplate = '''
import 'package:%{package}/src/page/%{nameSnake}/%{nameSnake}_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class %{name}Cubit extends Cubit<%{name}State> {
  %{name}Cubit() : super(%{name}Initial()) {}
}
''';

String stateTemplate = '''
import 'package:%{package}/src/data/service/network_exceptions.dart';

abstract class %{name}State {
  const %{name}State([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class %{name}Initial extends %{name}State {
  @override
  String toString() => '%{name}Initial';
}

class %{name}Loading extends %{name}State {
  @override
  String toString() => '%{name}Loading';
}

class %{name}Success extends %{name}State {
  @override
  String toString() => '%{name}Success';
}

class %{name}Failure extends %{name}State {
  final NetworkExceptions error;

  const %{name}Failure(this.error);

  @override
  String toString() => '%{name}Failure';
}
''';
