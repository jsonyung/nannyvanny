part of 'main_page_bloc.dart';

class TabNavigationState extends Equatable {
  final int selectedIndex;

  const TabNavigationState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
