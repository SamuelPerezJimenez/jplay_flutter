import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jplay_flutter/core/theme/theme.dart';
import 'package:jplay_flutter/features/preferences/presentation/pages/sport_selection_page.dart';
import 'package:jplay_flutter/features/preferences/presentation/widgets/setting_tile_widget.dart';
import '../../../../injection_container.dart';
import '../../data/models/city_model.dart';
import '../../data/models/sport_model.dart';
import '../bloc/preferences_bloc.dart';
import 'city_selection_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
          if (state is PreferencesLoaded) {
            String cityName = getCityNameFromId(state.cityId) ?? "N/A";
            String sportName = getSportNameFromId(state.sportId) ?? "N/A";

            return _buildBody(context, cityName, sportName);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, String cityName, String sportName) {
    var preferencesBloc = context.read<PreferencesBloc>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('My Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          SettingTile(
            title: cityName,
            subtitle: "Selected city",
            onTap: () async {
              int? newCityId = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                            value: sl<PreferencesBloc>(),
                            child: const CitySelectionPage(isFirstTime: false),
                          )));
              if (newCityId != null) {
                preferencesBloc.add(LoadPreferences());
              }
            },
          ),
          SettingTile(
            title: sportName,
            subtitle: "Selected sport",
            onTap: () async {
              int? newSportId = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: sl<PreferencesBloc>(),
                      child: const SportSelectionPage(isFirstTime: false),
                    ),
                  ));
              if (newSportId != null) {
                preferencesBloc.add(LoadPreferences());
              }
            },
          ),
        ],
      ),
    );
  }
}
