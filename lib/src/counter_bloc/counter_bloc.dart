import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterStateInit()) {
    on<CounterIncrementEvent>((event, emit) {
      _handleIncrement(event, emit);
    });

    on<CounterDecrementEvent>((event, emit) {
      _handleDecrement(event, emit);
    });
  }

  _handleIncrement(event, emit) {
    if (state.counter >= 5) {
      return;
    } else {
      emit(CounterIncrementState(state.counter + 1));
    }
  }

  _handleDecrement(event, emit) {
    if (state.counter <= 0) {
      return;
    } else {
      emit(CounterDecrementState(state.counter - 1));
    }
  }
}
