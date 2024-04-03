import 'package:messager/domain/model/user.dart';
import 'package:messager/domain/service/user_service.dart';

class UserServiceImpl implements UserService {
  @override
  Future<User> readCurrentUser() async {
    return const User(id: '1', name: 'User 1');
  }

  @override
  Future<List<User>> readUsers() async {
    return const <User>[
      User(id: '2', name: 'User 2'),
      User(id: '3', name: 'User 3'),
    ];
  }
}
