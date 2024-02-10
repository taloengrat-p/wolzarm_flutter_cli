import 'package:wolzarm_flutter_cli/src/screens/test/test_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial()) {}
}
