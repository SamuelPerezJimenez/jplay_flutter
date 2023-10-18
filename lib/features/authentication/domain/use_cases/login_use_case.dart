import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/authentication_repository.dart';
import 'use_case.dart';

class LoginUser implements UseCase<User, LoginUserParams> {
  final AuthenticationRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginUserParams params) async {
    return await repository.login(params.username, params.password);
  }
}

class LoginUserParams {
  final String username;
  final String password;

  LoginUserParams({required this.username, required this.password});
}
