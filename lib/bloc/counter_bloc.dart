import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/bloc/counter_event.dart';
import 'package:statemanagement/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterIncrementEvent,CounterState>{
// since the Bloc needs a intitial value therefore we are passing the value through super.
CounterBloc():super(CounterState(count: 0)){
  on<CounterIncrementEvent>((event,emit)=>emit(CounterState(count: state.count+1)));
}
}