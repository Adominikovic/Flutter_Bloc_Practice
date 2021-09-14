part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterState(this.counterValue, this.wasIncremented);

  @override
  List<Object> get props => [this.counterValue, this.wasIncremented];
}
