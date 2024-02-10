
abstract class TestState {
  const TestState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class TestInitial extends TestState {
  @override
  String toString() => 'TestInitial';
}

class TestLoading extends TestState {
  @override
  String toString() => 'TestLoading';
}

class TestSuccess extends TestState {
  @override
  String toString() => 'TestSuccess';
}

class TestFailure extends TestState {
  @override
  String toString() => 'TestFailure';
}
