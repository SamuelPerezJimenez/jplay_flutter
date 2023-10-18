part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class Authenticated extends AuthenticationState {}

final class Authenticating extends AuthenticationState {}

final class Unauthenticated extends AuthenticationState {}
