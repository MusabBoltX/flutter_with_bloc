abstract class CounterState {
  int counter = 0;
  CounterState({required this.counter});
}

class CounterStateInit extends CounterState {
  CounterStateInit() : super(counter: 0);
}

class CounterIncrementState extends CounterState {
  CounterIncrementState(int counter) : super(counter: counter);
}

class CounterDecrementState extends CounterState {
  CounterDecrementState(int counter) : super(counter: counter);
}