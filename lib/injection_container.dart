import 'package:get_it/get_it.dart';
import 'package:jplay_flutter/features/authentication/data/datasource/authentication_remote_source.dart';
import 'package:jplay_flutter/features/authentication/data/repositories/aithentication_repository.dart';
import 'package:jplay_flutter/features/authentication/presentation/bloc/authentication_bloc.dart';

import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/use_cases/login_use_case.dart';
import 'features/navigation/presentation/bloc/navigation_bloc_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//****************Blocs********************//
  sl.registerFactory(() => NavigationBloc());
  sl.registerFactory(() => AuthenticationBloc(sl()));

//****************DataSources*************//

  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(),
  );
  //*************Repositories*************//

  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()));

  //*************UseCases****************//
  sl.registerLazySingleton(() => LoginUser(sl()));
}
