import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../datasource/preferences_local_source.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, int>> getCityPreference();
  Future<Either<Failure, int>> getSportPreference();
  Future<Either<Failure, void>> setCityPreference(int cityId);
  Future<Either<Failure, void>> setSportPreference(int sportId);
}

class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesLocalSource localSource;

  PreferencesRepositoryImpl({required this.localSource});

  @override
  Future<Either<Failure, int>> getCityPreference() async {
    try {
      final cityId = await localSource.getCityPreference();
      if (cityId != null) {
        return Right(cityId);
      } else {
        return const Left(NoDataFailure());
      }
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getSportPreference() async {
    try {
      final sportId = await localSource.getSportPreference();
      if (sportId != null) {
        return Right(sportId);
      } else {
        return const Left(NoDataFailure());
      }
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setCityPreference(int cityId) async {
    try {
      await localSource.setCityPreference(cityId);
      return const Right(unit);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setSportPreference(int sportId) async {
    try {
      await localSource.setSportPreference(sportId);
      return const Right(unit);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }
}
