import 'package:messager/domain/model/user.dart';

abstract interface class UserService {
  Future<List<User>> readUsers();

  Future<User> readCurrentUser();
}
