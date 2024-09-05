part of 'dropdown_bloc.dart';

enum DropdownType { city, relation }

abstract class DropdownEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateDropdownSelection extends DropdownEvent {
  final String newValue;
  final DropdownType type;

  UpdateDropdownSelection(this.newValue, this.type);

  @override
  List<Object?> get props => [newValue, type];
}
