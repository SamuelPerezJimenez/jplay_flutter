part of 'navigation_bloc_bloc.dart';

abstract class NavigationBlocState extends Equatable {
  final int selectedIndex;
  const NavigationBlocState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

final class NavigationBlocInitial extends NavigationBlocState {
  const NavigationBlocInitial() : super(0);
}

class PickUpPageNavigationState extends NavigationBlocState {
  const PickUpPageNavigationState() : super(0);
}

class SettingsPagesNavigationState extends NavigationBlocState {
  const SettingsPagesNavigationState() : super(1);
}
