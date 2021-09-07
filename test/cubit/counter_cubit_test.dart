import 'package:bloc_practice/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    test(
        'Assert that initial state for CounterCubit is CounterState(CounterValue:0, wasIncremented: false)',
        () {
      expect(counterCubit.state, CounterState(0, false));
    });

    blocTest(
      'the counterCubit should emit a CounterState(counterValue: 1, wasIncremented: true) when counterCubit.increment() is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(1, true)],
    );
    blocTest(
      'the counterCubit should emit a CounterState(counterValue: -1, wasIncremented: false) when counterCubit.decrement() is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(-1, false)],
    );
  });
}
