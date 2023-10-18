import 'package:dartz/dartz.dart';
import 'package:jplay_flutter/core/errors/exceptions.dart';
import 'package:jplay_flutter/features/authentication/data/datasource/authentication_remote_source.dart';
import 'package:jplay_flutter/features/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    try {
      var userExist = await remoteDataSource.login(username, password);

      if (userExist != null) {
        return Right(userExist);
      } else {
        return const Left(InvalidCredentialsFailure());
      }
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } on CacheException {
      return const Left(UnexpectedFailure());
    }
  }
}
