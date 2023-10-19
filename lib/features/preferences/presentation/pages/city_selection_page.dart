import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jplay_flutter/core/theme/theme.dart';
import 'package:jplay_flutter/core/widgets/textformfield_widget.dart';
import 'package:jplay_flutter/features/preferences/presentation/pages/sport_selection_page.dart';

import '../../../../injection_container.dart';
import '../../data/models/city_model.dart';
import '../bloc/preferences_bloc.dart';

class CitySelectionPage extends StatefulWidget {
  const CitySelectionPage({super.key, required this.isFirstTime});

  final bool isFirstTime;

  @override
  _CitySelectionPageState createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  List<City> filteredCities = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCities = cities;
    searchController.addListener(searchListener);
  }

  @override
  void dispose() {
    searchController.removeListener(searchListener);
    searchController.dispose();
    super.dispose();
  }

  void searchListener() {
    final searchText = searchController.text.toLowerCase();
    setState(() {
      filteredCities = cities
          .where((city) => city.name.toLowerCase().contains(searchText))
          .toList();
    });
  }

  void _handleCitySelection(int cityId) {
    final preferencesBloc = BlocProvider.of<PreferencesBloc>(context);
    preferencesBloc.add(UpdateCityPreference(cityId: cityId));
    if (mounted) {
      if (widget.isFirstTime) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: sl<PreferencesBloc>(),
                child: const SportSelectionPage(isFirstTime: true),
              ),
            ));
      } else {
        Navigator.pop(context, cityId);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Choose a city"),
          backgroundColor: AppTheme.primaryColor),
      body: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            TextFormFieldWidget(
              labelText: "Search city by name",
              controller: searchController,
              iconData: Icons.search,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCities.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () => _handleCitySelection(filteredCities[index].id),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  title: Text(
                    filteredCities[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    filteredCities[index].location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  leading: Container(
                    width: 74,
                    height: 55,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // tileColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
