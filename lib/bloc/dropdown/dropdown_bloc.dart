import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_event.dart';
part 'dropdown_state.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc(String initialValue) : super(DropdownState(initialValue)) {
    on<UpdateDropdownSelection>((event, emit) {
      emit(DropdownState(event.newValue));
    });
  }
}
