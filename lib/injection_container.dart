import 'package:get_it/get_it.dart';
import 'package:jplay_flutter/features/authentication/data/datasource/authentication_remote_source.dart';
import 'package:jplay_flutter/features/authentication/data/repositories/aithentication_repository.dart';
import 'package:jplay_flutter/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:jplay_flutter/features/preferences/presentation/bloc/preferences_bloc.dart';

import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/use_cases/login_use_case.dart';
import 'features/navigation/presentation/bloc/navigation_bloc_bloc.dart';
import 'features/preferences/data/repositories/preferences_repository_impl.dart';
import 'features/preferences/data/datasource/preferences_local_source.dart';
import 'features/preferences/domain/use_cases/get_preference_use_case.dart';
import 'features/preferences/domain/use_cases/save_preference_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //****************Blocs********************//
  sl.registerFactory(() => NavigationBloc());
  sl.registerFactory(() => AuthenticationBloc(sl()));
  sl.registerFactory(() => PreferencesBloc(preferencesLocalSource: sl()));

  //****************DataSources*************//
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<PreferencesLocalSource>(
    () => PreferencesLocalSourceImpl(),
  );

  //*************Repositories*************//
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()));

  sl.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(localSource: sl()),
  );

  //*************UseCases****************//
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => GetPreferenceUseCase(sl()));
  sl.registerLazySingleton(() => SavePreferenceUseCase(sl()));
}
