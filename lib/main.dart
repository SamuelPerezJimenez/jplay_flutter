import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/global_keys.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/authentication/presentation/pages/login_page.dart';
import 'features/navigation/presentation/bloc/navigation_bloc_bloc.dart';
import 'features/navigation/presentation/widgets/navigation_bar.dart';
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
          ],
          child: BlocProvider(
            create: (_) => sl<AuthenticationBloc>(),
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return Container();
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

          ),
    );
  }
}
