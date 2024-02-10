import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcap_myt/src/screens/test/test_cubit.dart';
import 'package:tcap_myt/src/screens/test/test_state.dart';
import 'package:tcap_myt/src/widgets/layouts/main_layout.dart'; 

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TestCubit cubit = TestCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: BlocListener<TestCubit, TestState>(
        listener: (context, state) {
          log('Bloclistener: state: $state', name: runtimeType.toString());
        },
        child: BlocBuilder<TestCubit, TestState>(builder: (BuildContext context, state) {
          return MainLayout(
            title: Text('TestScreen'),
            body: ListView(),
          );
        }),
      ),
    );
  }
}
