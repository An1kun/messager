import 'package:flutter/cupertino.dart';
import 'package:messager/domain/service/user_service_impl.dart';
import 'package:messager/presentation/app.dart';
import 'package:messager/presentation/controller/user_controller.dart';

Future<void> main() async {
  late final UserController userController;

  userController = UserController(userService: UserServiceImpl());

  await userController.readCurrentUser();

  await userController.readUsers();

  runApp(
    UserControllerScope(
      userController: userController,
      child: const App(),
    ),
  );
}
