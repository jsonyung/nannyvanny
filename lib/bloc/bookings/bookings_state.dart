part of 'bookings_bloc.dart';

abstract class BookingsState extends Equatable {
  @override
  List<Object> get props => [];
}

class BookingsInitial extends BookingsState {}

class BookingsLoading extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<Booking> bookings;

  BookingsLoaded(this.bookings);

  @override
  List<Object> get props => [bookings];
}

class BookingsError extends BookingsState {
  final String error;

  BookingsError(this.error);

  @override
  List<Object> get props => [error];
}
