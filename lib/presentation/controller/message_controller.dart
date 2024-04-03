import 'package:flutter/material.dart';
import 'package:messager/domain/model/chat.dart';
import 'package:messager/domain/model/message.dart';
import 'package:messager/domain/model/user.dart';
import 'package:messager/domain/service/message_service.dart';

class MessageController extends ChangeNotifier {
  final MessageService messageService;
  final Chat chat;
  final User currentUser;

  MessageController({
    required this.messageService,
    required this.chat,
    required this.currentUser,
  });

  List<Message> messages = <Message>[];

  Future<void> createMessage(String text) async {
    await messageService.createMessage(
      chatId: chat.id,
      text: text,
      author: currentUser,
    );

    await readMessages();
  }

  Future<void> readMessages() async {
    messages = await messageService.readMessages(chatId: chat.id);
    notifyListeners();
  }
}

class MessageControllerScope extends InheritedWidget {
  final MessageController messageController;

  const MessageControllerScope({
    super.key,
    required this.messageController,
    required Widget child,
  }) : super(child: child);

  static MessageControllerScope of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<MessageControllerScope>();
    assert(result != null, 'No MessageControllerScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MessageControllerScope oldWidget) {
    return false;
  }
}
