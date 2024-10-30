import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/visiblity_bloc/visibility_event.dart';
import 'package:statemanagement/visiblity_bloc/visibility_state.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(VisibilityState(visible: true)) {
    on<HideVisibilityEvent>((event, emit) => emit(VisibilityState(visible: false)));
    on<ShowVisibilityEvent>((event, emit) => emit(VisibilityState(visible: true)));
  }
}