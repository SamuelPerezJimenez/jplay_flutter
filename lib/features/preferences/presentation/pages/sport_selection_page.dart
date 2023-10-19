import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jplay_flutter/core/theme/theme.dart';
import 'package:jplay_flutter/core/widgets/textformfield_widget.dart';
import 'package:jplay_flutter/features/preferences/data/models/sport_model.dart';

import '../../data/models/city_model.dart';
import '../bloc/preferences_bloc.dart';

class SportSelectionPage extends StatefulWidget {
  const SportSelectionPage({super.key});

  @override
  _SportSelectionPageState createState() => _SportSelectionPageState();
}

class _SportSelectionPageState extends State<SportSelectionPage> {
  List<Sport> filteredSports = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredSports = sports;
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
      filteredSports = sports
          .where((sport) => sport.name.toLowerCase().contains(searchText))
          .toList();
    });
  }

  void _handleSportSelection(int sportId) {
    context
        .read<PreferencesBloc>()
        .add(UpdateSportPreference(sportId: sportId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Choose a sport"),
          backgroundColor: AppTheme.primaryColor),
      body: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            TextFormFieldWidget(
              labelText: "Search sport by name",
              controller: searchController,
              iconData: Icons.search,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSports.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () => _handleSportSelection(filteredSports[index].id),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  title: Text(
                    filteredSports[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
