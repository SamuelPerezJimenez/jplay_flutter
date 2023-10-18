import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;

  const User({
    required this.password,
    required this.email,
  });

  @override
  List<Object> get props => [email, password];
}
