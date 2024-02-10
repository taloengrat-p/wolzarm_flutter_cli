import 'package:flutter/material.dart';
import 'package:wolzarm_flutter_cli/src/routes/base_router.dart';
import 'package:wolzarm_flutter_cli/src/screens/test/test_screen.dart';

class TestRouter extends BaseRouter {
  BuildContext context;

  TestRouter(this.context) : super(context, screen: TestScreen());

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
