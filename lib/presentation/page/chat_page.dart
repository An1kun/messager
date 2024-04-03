import 'package:flutter/material.dart';
import 'package:messager/domain/model/chat.dart';
import 'package:messager/domain/service/message_service_impl.dart';
import 'package:messager/presentation/component/message_list.dart';
import 'package:messager/presentation/component/message_text_field.dart';
import 'package:messager/presentation/controller/message_controller.dart';
import 'package:messager/presentation/controller/user_controller.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.chat});

  static const path = '/chat-page';

  static route({required Chat chat}) => MaterialPageRoute(
        settings: const RouteSettings(name: ChatPage.path),
        builder: (_) => ChatPage(chat: chat),
      );

  final Chat chat;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final MessageController messageController;
  late final UserController userController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userController = UserControllerScope.of(context).userController;

    messageController = MessageController(
      chat: widget.chat,
      messageService: MessageServiceImpl(),
      currentUser: userController.currentUser,
    );

    messageController.readMessages();
  }

  @override
  Widget build(BuildContext context) {
    return MessageControllerScope(
      messageController: messageController,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.chat.name),
        ),
        body: const Column(
          children: [
            Expanded(child: MessageList()),
            MessageTextField(),
          ],
        ),
      ),
    );
  }
}
