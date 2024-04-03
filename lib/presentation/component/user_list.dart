import 'package:flutter/material.dart';
import 'package:messager/domain/model/user.dart';
import 'package:messager/presentation/component/user_card.dart';
import 'package:messager/presentation/controller/create_chat_controller.dart';
import 'package:messager/presentation/controller/user_controller.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late final List<User> users;
  late final CreateChatController createChatController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    users = UserControllerScope.of(context).userController.users;
    createChatController =
        CreateChatControllerScope.of(context).createChatController;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: createChatController,
      builder: (context, child) => ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) => Row(
          children: [
            Checkbox(
              value: createChatController.participants.contains(users[index]),
              onChanged: (_) =>
                  createChatController.selectParticipant(users[index]),
            ),
            UserCard(user: users[index]),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
        itemCount: users.length,
      ),
    );
  }
}
