part of 'bookings_bloc.dart';

abstract class BookingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBookings extends BookingsEvent {}
