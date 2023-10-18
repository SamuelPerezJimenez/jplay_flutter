import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String password,
    required String email,
  }) : super(
          email: email,
          password: password,
        );
}
