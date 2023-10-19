import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  final String message;

  const Failure({this.properties = const <dynamic>[], this.message = ''});

  @override
  List<Object> get props => [properties, message];
}

class InvalidCredentialsFailure extends Failure {
  @override
  final String message;

  const InvalidCredentialsFailure({this.message = 'Invalid credentials'})
      : super(message: message);
}

class UnauthorizedFailure extends Failure {
  @override
  final String message;

  const UnauthorizedFailure(
      {this.message = 'Unauthorized, please log in again'})
      : super(message: message);
}

class UnexpectedFailure extends Failure {
  @override
  final String message;

  const UnexpectedFailure(
      {this.message = 'UnexpectedFailure, please contact 1-909-232-3232'})
      : super(message: message);
}

class NoDataFailure extends Failure {
  @override
  final String message;

  const NoDataFailure({this.message = 'No data available'})
      : super(message: message);
}

class CacheFailure extends Failure {
  @override
  final String message;

  const CacheFailure({this.message = 'Cache failure'})
      : super(message: message);
}
