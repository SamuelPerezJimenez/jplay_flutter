part of 'navigation_bloc_bloc.dart';

sealed class NavigationBlocState extends Equatable {
  const NavigationBlocState();

  @override
  List<Object> get props => [];
}

final class NavigationBlocInitial extends NavigationBlocState {}

class PickUpPageNavigationState extends NavigationBlocState {}

class SettingsPagesNavigationState extends NavigationBlocState {}
