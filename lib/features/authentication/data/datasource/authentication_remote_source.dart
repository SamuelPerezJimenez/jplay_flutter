import '../../../../core/constants/users_data.dart';
import '../models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserModel?> login(String email, String password);
  Future<void> logout();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  UserModel? _user;

  @override
  Future<UserModel?> login(String email, String password) async {
    try {
      final userMap = usersData.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
      );

      _user =
          UserModel(email: userMap['email']!, password: userMap['password']!);
      return _user;
    } catch (e) {
      if (e is StateError) {
        return null;
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<void> logout() async {
    _user = null;
  }
}
