import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/datasource/preferences_local_source.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final PreferencesLocalSource preferencesLocalSource;

  PreferencesBloc({required this.preferencesLocalSource})
      : super(PreferencesInitial()) {
    on<LoadPreferences>(_onLoadPreferences);
    on<UpdateCityPreference>(_onUpdateCityPreference);
    on<UpdateSportPreference>(_onUpdateSportPreference);
    on<ClearCityPreference>(_onClearCityPreference);
    on<ClearSportPreference>(_onClearSportPreference);
  }

  Future<void> _onLoadPreferences(
      LoadPreferences event, Emitter<PreferencesState> emit) async {
    try {
      int? cityId = await preferencesLocalSource.getCityPreference();
      int? sportId = await preferencesLocalSource.getSportPreference();
      emit(PreferencesLoaded(cityId: cityId, sportId: sportId));
    } catch (e) {
      emit(PreferencesLoadFailed(errorMessage: e.toString()));
    }
  }

  Future<void> _onUpdateCityPreference(
      UpdateCityPreference event, Emitter<PreferencesState> emit) async {
    try {
      await preferencesLocalSource.setCityPreference(event.cityId);
      emit(CityPreferenceUpdated(cityId: event.cityId));
    } catch (e) {
      emit(PreferenceUpdateFailed(errorMessage: e.toString()));
    }
  }

  Future<void> _onUpdateSportPreference(
      UpdateSportPreference event, Emitter<PreferencesState> emit) async {
    try {
      await preferencesLocalSource.setSportPreference(event.sportId);
      emit(SportPreferenceUpdated(sportId: event.sportId));
    } catch (e) {
      emit(PreferenceUpdateFailed(errorMessage: e.toString()));
    }
  }

  Future<void> _onClearCityPreference(
      ClearCityPreference event, Emitter<PreferencesState> emit) async {
    try {
      await preferencesLocalSource.clearCityPreference();
      emit(CityPreferenceCleared());
    } catch (e) {
      emit(PreferenceClearFailed(errorMessage: e.toString()));
    }
  }

  Future<void> _onClearSportPreference(
      ClearSportPreference event, Emitter<PreferencesState> emit) async {
    try {
      await preferencesLocalSource.clearSportPreference();
      emit(SportPreferenceCleared());
    } catch (e) {
      emit(PreferenceClearFailed(errorMessage: e.toString()));
    }
  }
}
