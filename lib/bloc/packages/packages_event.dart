part of 'packages_bloc.dart';

abstract class PackagesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPackages extends PackagesEvent {}
