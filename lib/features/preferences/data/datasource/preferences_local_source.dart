import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesLocalSource {
  Future<void> setCityPreference(int cityId);
  Future<void> setSportPreference(int sportId);
  Future<int?> getCityPreference();
  Future<int?> getSportPreference();
  Future<bool> hasCityPreference();
  Future<bool> hasSportPreference();
  Future<void> clearCityPreference();
  Future<void> clearSportPreference();
}

class PreferencesLocalSourceImpl implements PreferencesLocalSource {
  static const CITY_ID_PREF = 'CITY_ID_PREF';
  static const SPORT_ID_PREF = 'SPORT_ID_PREF';

  @override
  Future<void> setCityPreference(int cityId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(CITY_ID_PREF, cityId);
  }

  @override
  Future<void> setSportPreference(int sportId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(SPORT_ID_PREF, sportId);
  }

  @override
  Future<int?> getCityPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(CITY_ID_PREF);
  }

  @override
  Future<int?> getSportPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SPORT_ID_PREF);
  }

  @override
  Future<bool> hasCityPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(CITY_ID_PREF);
  }

  @override
  Future<bool> hasSportPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(SPORT_ID_PREF);
  }

  @override
  Future<void> clearCityPreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(CITY_ID_PREF);
  }

  @override
  Future<void> clearSportPreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(SPORT_ID_PREF);
  }
}
