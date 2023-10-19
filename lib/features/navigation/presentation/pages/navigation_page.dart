import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jplay_flutter/features/navigation/presentation/widgets/navigation_bar.dart';

import '../../../../injection_container.dart';
import '../bloc/navigation_bloc_bloc.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(
            create: (_) => sl<NavigationBloc>(),
          ),
        ],
        child: Scaffold(
          body: BlocBuilder<NavigationBloc, NavigationBlocState>(
            builder: (BuildContext context, NavigationBlocState state) {
              if (state is PickUpPageNavigationState) {
                return const Center(
                  child: Text('Pick Up'),
                );
              } else if (state is SettingsPagesNavigationState) {
                return const Center(
                  child: Text('Settings'),
                );
              }
              return Container();
            },
          ),
          bottomNavigationBar: const NavigationBarWidget(),
        ));
  }
}