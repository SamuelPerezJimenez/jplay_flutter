import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jplay_flutter/core/theme/theme.dart';

import '../../../../core/dates.dart';
import '../../../preferences/data/models/city_model.dart';
import '../../../preferences/data/models/sport_model.dart';
import '../../../preferences/presentation/bloc/preferences_bloc.dart';
import '../../data/models/pickup_game_model.dart';

class PickUpPage extends StatefulWidget {
  const PickUpPage({super.key});

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> {
  @override
  Widget build(BuildContext context) {
    final preferencesBloc = BlocProvider.of<PreferencesBloc>(context);

    return BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
      if (state is PreferencesLoaded) {
        String cityName = getCityNameFromId(state.cityId) ?? "N/A";
        String sportName = getSportNameFromId(state.sportId) ?? "N/A";

        List<PickUpGame> filteredGames =
            pickUpGames.where((game) => game.idSport == state.sportId).toList();

        filteredGames.sort((a, b) => a.date.compareTo(b.date));

        return Scaffold(
            appBar: AppBar(
              title: Text('$sportName in $cityName'),
              backgroundColor: AppTheme.primaryColor,
            ),
            body: Padding(
              padding: AppTheme.pagePadding,
              child: ListView.builder(
                itemCount: filteredGames.length,
                itemBuilder: (context, index) {
                  final game = filteredGames[index];

                  bool showHeader = true;
                  if (index > 0 &&
                      filteredGames[index - 1].date.day == game.date.day) {
                    showHeader = false;
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showHeader)
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 16.0, bottom: 8.0),
                          child: Text(
                            formatDate(game.date),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0.0),
                        title: Text(game.name),
                        subtitle: Text(game.description),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(DateFormat('HH:mm').format(DateTime(
                                2000, 1, 1, game.time.hour, game.time.minute))),
                            Text(
                                '${game.registeredParticipants}/${game.maxParticipants}'),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ));
      }
      return Container();
    });
  }
}
