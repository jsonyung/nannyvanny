import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/booking_model.dart';
import '../../repository/bookings_repository.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final BookingsRepository repository;

  BookingsBloc(this.repository) : super(BookingsInitial()) {
    on<FetchBookings>((event, emit) async {
      emit(BookingsLoading());
      try {
        final bookings = await repository.fetchBookings();
        emit(BookingsLoaded(bookings));
      } catch (e) {
        emit(BookingsError(e.toString()));
      }
    });
  }
}
