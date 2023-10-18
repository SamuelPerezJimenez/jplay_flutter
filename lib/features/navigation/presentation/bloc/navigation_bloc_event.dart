part of 'navigation_bloc_bloc.dart';

sealed class NavigationBlocEvent extends Equatable {
  const NavigationBlocEvent();

  @override
  List<Object> get props => [];
}

class NavigateToPickUpPageEvent extends NavigationBlocEvent {}

class NavigateToSettingsPageEvent extends NavigationBlocEvent {}
