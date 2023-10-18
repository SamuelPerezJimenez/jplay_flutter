import 'package:jplay_flutter/features/authentication/domain/entities/user.dart';

import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> login(String email, String password);

  Future<Either<Failure, void>> logout();
}
