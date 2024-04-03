import 'package:flutter/material.dart';
import 'package:messager/domain/model/user.dart';
import 'package:messager/domain/service/user_service.dart';

class UserController extends ChangeNotifier {
  final UserService userService;

  static UserController? _instance;

  factory UserController({required UserService userService}) {
    _instance ??= UserController._internal(userService);
    return _instance!;
  }

  UserController._internal(this.userService);

  List<User> users = <User>[];
  late User currentUser;

  Future<void> readCurrentUser() async {
    currentUser = await userService.readCurrentUser();
    notifyListeners();
  }

  Future<void> readUsers() async {
    users = await userService.readUsers();
  }
}

class UserControllerScope extends InheritedWidget {
  final UserController userController;

  const UserControllerScope({
    super.key,
    required this.userController,
    required Widget child,
  }) : super(child: child);

  static UserControllerScope of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<UserControllerScope>();
    assert(result != null, 'No UserControllerScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
