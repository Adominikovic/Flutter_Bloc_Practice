import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/constants/enums.dart';
import 'package:bloc_practice/logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0, false));

  void increment() =>
      emit(CounterState(state.counterValue + 1, state.wasIncremented = true));

  void decrement() =>
      emit(CounterState(state.counterValue - 1, state.wasIncremented = false));
}
