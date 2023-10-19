import 'package:dartz/dartz.dart';
import 'package:jplay_flutter/features/preferences/data/repositories/preferences_repository_impl.dart';

import '../../../../core/errors/failures.dart';

class GetPreferenceUseCase {
  final PreferencesRepository repository;

  GetPreferenceUseCase(this.repository);

  Future<Either<Failure, int>> getCityPreference() async {
    return await repository.getCityPreference();
  }

  Future<Either<Failure, int>> getSportPreference() async {
    return await repository.getSportPreference();
  }
}
