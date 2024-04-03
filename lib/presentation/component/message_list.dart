import 'package:flutter/material.dart';
import 'package:messager/presentation/component/message_card.dart';
import 'package:messager/presentation/controller/message_controller.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  late final MessageController messageController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    messageController = MessageControllerScope.of(context).messageController;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: messageController,
      builder: (context, child) => ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) => MessageCard(
          message: messageController.messages[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
        itemCount: messageController.messages.length,
      ),
    );
  }
}
