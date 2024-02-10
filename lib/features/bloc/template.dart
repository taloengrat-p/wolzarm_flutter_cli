String pageTemplate = '''import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcap_myt/src/screens/%{nameSnake}/%{nameSnake}_cubit.dart';
import 'package:tcap_myt/src/screens/%{nameSnake}/%{nameSnake}_state.dart';

class %{name}Page extends StatefulWidget {
  final %{name}Cubit cubit;
  const %{name}Page(
    this.cubit, {
    Key? key,
  }) : super(key: key);

  @override
  %{name}PageState createState() => %{name}PageState();
}

class %{name}PageState extends State<%{name}Page> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => widget.cubit,
      child: BlocListener<%{name}Cubit, %{name}State>(
        listener: (context, state) {
          log('Bloclistener: state: \$state', name: runtimeType.toString());
        },
        child: BlocBuilder<%{name}Cubit, %{name}State>(builder: (BuildContext context, state) {
          return Scaffold(
            body: Container(),
          );
        }),
      ),
    );
  }
}
''';

String cubitTemplate = '''
import 'package:%{package}/src/screens/%{nameSnake}/%{nameSnake}_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class %{name}Cubit extends Cubit<%{name}State> {
  %{name}Cubit() : super(%{name}Initial()) {}
}
''';

String stateTemplate = '''

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
  @override
  String toString() => '%{name}Failure';
}
''';

String screenTemplate = '''import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcap_myt/src/screens/%{nameSnake}/%{nameSnake}_cubit.dart';
import 'package:tcap_myt/src/screens/%{nameSnake}/%{nameSnake}_state.dart';
import 'package:tcap_myt/src/widgets/layouts/main_layout.dart'; 

class %{name}Screen extends StatefulWidget {
  const %{name}Screen({Key? key}) : super(key: key);

  @override
  %{name}ScreenState createState() => %{name}ScreenState();
}

class %{name}ScreenState extends State<%{name}Screen> {
  %{name}Cubit cubit = %{name}Cubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: BlocListener<%{name}Cubit, %{name}State>(
        listener: (context, state) {
          log('Bloclistener: state: \$state', name: runtimeType.toString());
        },
        child: BlocBuilder<%{name}Cubit, %{name}State>(builder: (BuildContext context, state) {
          return MainLayout(
            title: Text('%{name}Screen'),
            body: ListView(),
          );
        }),
      ),
    );
  }
}
''';

String routerTemplate = '''import 'package:flutter/material.dart';
import 'package:%{package}/src/routes/base_router.dart';
import 'package:%{package}/src/screens/%{nameSnake}/%{nameSnake}_screen.dart';

class %{name}Router extends BaseRouter {
  BuildContext context;

  %{name}Router(this.context) : super(context, screen: %{name}Screen());

  @override
  Future navigate() {
    return super.navigate();
  }

  @override
  Future replace() {
    // TODO: implement replace
    return super.replace();
  }

  @override
  void pop() {
    // TODO: implement pop
    super.pop();
  }
}
''';
