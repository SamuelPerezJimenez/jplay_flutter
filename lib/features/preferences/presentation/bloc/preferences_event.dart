part of 'preferences_bloc.dart';

abstract class PreferencesEvent extends Equatable {
  const PreferencesEvent();

  @override
  List<Object> get props => [];
}

class LoadPreferences extends PreferencesEvent {}

class UpdateCityPreference extends PreferencesEvent {
  final int cityId;

  const UpdateCityPreference({required this.cityId});

  @override
  List<Object> get props => [cityId];
}

class UpdateSportPreference extends PreferencesEvent {
  final int sportId;

  const UpdateSportPreference({required this.sportId});

  @override
  List<Object> get props => [sportId];
}

class ClearCityPreference extends PreferencesEvent {}

class ClearSportPreference extends PreferencesEvent {}
