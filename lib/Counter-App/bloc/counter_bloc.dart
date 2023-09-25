import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

part 'counter_event.dart'; 


class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc():super(InitialState()){
    on<IncrementEvent>((event, emit){
      emit(CounterState(counter: state.counter+1));
    });

    on<DecrementEvent>((event, emit){
      emit(CounterState(counter:state.counter-1));
    });
  }
}