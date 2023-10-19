import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/global_keys.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/authentication/presentation/pages/login_page.dart';
import 'features/navigation/presentation/bloc/navigation_bloc_bloc.dart';
import 'features/navigation/presentation/pages/navigation_page.dart';
import 'features/navigation/presentation/widgets/navigation_bar.dart';
import 'features/preferences/presentation/bloc/preferences_bloc.dart';
import 'features/preferences/presentation/pages/city_selection_page.dart';
import 'features/preferences/presentation/pages/sport_selection_page.dart';
import 'injection_container.dart' as injection;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: 'Jplay',
        home: MultiBlocProvider(
          providers: [
            BlocProvider<NavigationBloc>(
              create: (_) => sl<NavigationBloc>(),
            ),
            BlocProvider<AuthenticationBloc>(
              create: (_) => sl<AuthenticationBloc>(),
            ),
            BlocProvider<PreferencesBloc>(
              create: (_) => sl<PreferencesBloc>(),
            ),
          ],
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, authState) {
              if (authState is Authenticated) {
                context.read<PreferencesBloc>().add(LoadPreferences());
              }
            },
            builder: (context, authState) {
              if (authState is Authenticated) {
                return BlocBuilder<PreferencesBloc, PreferencesState>(
                  builder: (context, prefState) {
                    if (prefState is PreferencesLoaded) {
                      if (prefState.cityId != null &&
                          prefState.sportId != null) {
                        return const NavigationPage();
                      } else if (prefState.cityId == null) {
                        return const CitySelectionPage();
                      } else if (prefState.sportId == null) {
                        return const SportSelectionPage();
                      }
                    }

                    return Container(); // Puede ser una página de carga o cualquier otro contenedor predeterminado
                  },
                );
              } else {
                return const LoginPage();
              }
            },
          ),
        )

        // body: BlocBuilder<NavigationBloc, NavigationBlocState>(
        //   builder: (BuildContext context, NavigationBlocState state) {
        //     if (state is PickUpPageNavigationState) {
        //       return const Center(
        //         child: Text('Pick Up'),
        //       );
        //     } else if (state is SettingsPagesNavigationState) {
        //       return const Center(
        //         child: Text('Settings'),
        //       );
        //     }
        //     return Container();
        //   },
        // ),
        // bottomNavigationBar: const NavigationBarWidget(),

        );
  }
}
