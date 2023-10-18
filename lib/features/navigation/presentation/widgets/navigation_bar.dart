import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jplay_flutter/core/theme/theme.dart';
import 'package:jplay_flutter/features/navigation/presentation/bloc/navigation_bloc_bloc.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  void _onItemTapped(int index, BuildContext context) {
    final navigationBloc = BlocProvider.of<NavigationBloc>(context);
    if (index == 0) {
      navigationBloc.add(NavigateToPickUpPageEvent());
    } else if (index == 1) {
      navigationBloc.add(NavigateToSettingsPageEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationBloc = BlocProvider.of<NavigationBloc>(context);
    return BlocBuilder<NavigationBloc, NavigationBlocState>(
      bloc: navigationBloc,
      builder: (BuildContext context, NavigationBlocState state) {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Pick Up',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
          currentIndex: state.selectedIndex,
          onTap: (index) => _onItemTapped(index, context),
          selectedItemColor: AppTheme.primaryColor,
        );
      },
    );
  }
}
