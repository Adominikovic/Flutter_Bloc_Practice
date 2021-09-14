import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/constants/enums.dart';
import 'package:bloc_practice/logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;

  CounterCubit({@required this.internetCubit}) : super(CounterState(0, false)) {
    monitorInternetCubit();
  }

  void monitorInternetCubit() {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() =>
      emit(CounterState(state.counterValue + 1, state.wasIncremented = true));

  void decrement() =>
      emit(CounterState(state.counterValue - 1, state.wasIncremented = false));

  @override
  Future<Function> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
