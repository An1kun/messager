import 'package:flutter/material.dart';
import 'package:messager/domain/service/chat_service_impl.dart';
import 'package:messager/presentation/component/chat_list.dart';
import 'package:messager/presentation/component/create_chat_floating_button.dart';
import 'package:messager/presentation/controller/chat_controller.dart';
import 'package:messager/presentation/controller/user_controller.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  static const path = '/chat-list-page';

  static route() => MaterialPageRoute(
        settings: const RouteSettings(name: ChatListPage.path),
        builder: (_) => const ChatListPage(),
      );

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  late final ChatController chatController;
  late final UserController userController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userController = UserControllerScope.of(context).userController;

    chatController = ChatController(
      chatService: ChatServiceImpl(),
      currentUser: userController.currentUser,
    );

    chatController.readChats();
  }

  @override
  Widget build(BuildContext context) {
    return ChatControllerScope(
      chatController: chatController,
      child: Scaffold(
        appBar: AppBar(title: const Text('My Chats')),
        floatingActionButton: const CreateChatFloatingButton(),
        body: const ChatList(),
      ),
    );
  }
}
