import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0, isFive: false)) {
    on<IncrementEvent>((event, emit) {
      if(state.count < 5) {
        final newCount = state.count + 1;
        if (newCount == 5) {
          emit(CounterState(state.count + 1, isFive: true));
        } else {
          emit(CounterState(newCount, isFive: false));
        }
      }
    },);

    on<DecrementEvent>((event, emit) {
      final newCount = state.count - 1;
      emit(CounterState(newCount, isFive:false));
    },);



  }}