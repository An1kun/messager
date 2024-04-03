import 'package:messager/domain/model/user.dart';
import 'package:messager/domain/service/user_service.dart';

class UserServiceImpl implements UserService {
  @override
  Future<User> readCurrentUser() async {
    return const User(id: '1', name: 'Myself');
  }

  @override
  Future<List<User>> readUsers() async {
    return const <User>[
      User(id: '2', name: 'Mother'),
      User(id: '3', name: 'Papa'),
      User(id: '4', name: 'Sanya'),
      User(id: '5', name: 'Tonya'),
      User(id: '6', name: 'Alikhan'),
      User(id: '7', name: 'Maksat'),
      User(id: '8', name: 'Zarina'),
      User(id: '9', name: 'Aman'),
    ];
  }
}
