part of 'preferences_bloc.dart';

sealed class PreferencesState extends Equatable {
  const PreferencesState();

  @override
  List<Object> get props => [];
}

class PreferencesInitial extends PreferencesState {}

class PreferencesLoaded extends PreferencesState {
  final int? cityId;
  final int? sportId;

  const PreferencesLoaded({this.cityId, this.sportId});

  @override
  List<Object> get props => [cityId ?? -1, sportId ?? -1];
}

class CityPreferenceUpdated extends PreferencesState {
  final int cityId;

  const CityPreferenceUpdated({required this.cityId});

  @override
  List<Object> get props => [cityId];
}

class SportPreferenceUpdated extends PreferencesState {
  final int sportId;

  const SportPreferenceUpdated({required this.sportId});

  @override
  List<Object> get props => [sportId];
}

class CityPreferenceCleared extends PreferencesState {}

class SportPreferenceCleared extends PreferencesState {}

class PreferenceUpdateFailed extends PreferencesState {
  final String errorMessage;

  const PreferenceUpdateFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PreferenceClearFailed extends PreferencesState {
  final String errorMessage;

  const PreferenceClearFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PreferencesLoadFailed extends PreferencesState {
  final String errorMessage;

  const PreferencesLoadFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PreferencesError extends PreferencesState {
  final String errorMessage;

  const PreferencesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
