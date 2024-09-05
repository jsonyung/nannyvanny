part of 'dropdown_bloc.dart';

class DropdownState extends Equatable {
  final String selectedValue;

  const DropdownState(this.selectedValue);

  @override
  List<Object> get props => [selectedValue];
}
