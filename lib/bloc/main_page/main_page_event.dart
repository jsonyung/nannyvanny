part of 'main_page_bloc.dart';

abstract class TabNavigationEvent extends Equatable {
  const TabNavigationEvent();

  @override
  List<Object> get props => [];
}

class ChangeTab extends TabNavigationEvent {
  final int index;

  const ChangeTab(this.index);

  @override
  List<Object> get props => [index];
}
