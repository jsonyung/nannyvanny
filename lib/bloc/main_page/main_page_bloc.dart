import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class TabNavigationBloc extends Bloc<TabNavigationEvent, TabNavigationState> {
  TabNavigationBloc() : super(TabNavigationState(0)) {
    on<ChangeTab>((event, emit) {
      emit(TabNavigationState(event.index));
    });
  }
}
