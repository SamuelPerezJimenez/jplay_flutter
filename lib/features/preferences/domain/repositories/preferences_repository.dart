abstract class PreferencesRepository {
  Future<void> setCityPreference(int cityId);
  Future<int?> getCityPreference();

  Future<void> setSportPreference(int sportId);
  Future<int?> getSportPreference();
}
