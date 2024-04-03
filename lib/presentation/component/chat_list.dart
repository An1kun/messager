import 'package:flutter/material.dart';
import 'package:messager/presentation/component/chat_card.dart';
import 'package:messager/presentation/controller/chat_controller.dart';
import 'package:messager/presentation/page/chat_page.dart';

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
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ChatPage.path,
              arguments: chatController.chats[index],
            );
          },
          child: ChatCard(chat: chatController.chats[index]),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
        itemCount: chatController.chats.length,
      ),
    );
  }
}
