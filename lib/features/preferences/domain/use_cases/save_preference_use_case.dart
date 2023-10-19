import '../../data/repositories/preferences_repository_impl.dart';

class SavePreferenceUseCase {
  final PreferencesRepository repository;

  SavePreferenceUseCase(this.repository);

  Future<void> saveCityPreference(int cityId) async {
    await repository.setCityPreference(cityId);
  }

  Future<void> saveSportPreference(int sportId) async {
    await repository.setSportPreference(sportId);
  }
}
