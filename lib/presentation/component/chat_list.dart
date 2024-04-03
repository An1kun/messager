import 'package:flutter/material.dart';
import 'package:messager/presentation/component/chat_card.dart';
import 'package:messager/presentation/controller/chat_controller.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late final ChatController chatController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    chatController = ChatControllerScope.of(context).chatController;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: chatController,
      builder: (context, child) => ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) => ChatCard(
          chat: chatController.chats[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
        itemCount: chatController.chats.length,
      ),
    );
  }
}
