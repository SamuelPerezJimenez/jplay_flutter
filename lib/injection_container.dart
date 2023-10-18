import 'package:get_it/get_it.dart';

import 'features/navigation/presentation/bloc/navigation_bloc_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//****************Blocs********************//
  sl.registerFactory(() => NavigationBloc());
}
