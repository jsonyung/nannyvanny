part of 'packages_bloc.dart';

abstract class PackagesState extends Equatable {
  @override
  List<Object> get props => [];
}

class PackagesInitial extends PackagesState {}

class PackagesLoading extends PackagesState {}

class PackagesLoaded extends PackagesState {
  final List<Package> packages;

  PackagesLoaded(this.packages);

  @override
  List<Object> get props => [packages];
}

class PackagesError extends PackagesState {
  final String error;

  PackagesError(this.error);

  @override
  List<Object> get props => [error];
}
