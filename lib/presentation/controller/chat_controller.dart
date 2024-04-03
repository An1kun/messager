import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messager/domain/model/chat.dart';
import 'package:messager/domain/model/user.dart';
import 'package:messager/domain/service/chat_service.dart';

class ChatController extends ChangeNotifier {
  final ChatService chatService;
  final User currentUser;

  static ChatController? _instance;

  factory ChatController({
    required ChatService chatService,
    required User currentUser,
  }) {
    _instance ??= ChatController._internal(
      chatService: chatService,
      currentUser: currentUser,
    );
    return _instance!;
  }

  ChatController._internal({
    required this.chatService,
    required this.currentUser,
  });

  List<Chat> chats = <Chat>[];
  StreamSubscription<Chat>? chatsSubscription;

  void readChats() {
    chatsSubscription =
        chatService.readChats(userId: currentUser.id).listen((chat) {
      chats.add(chat);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    chatsSubscription?.cancel();
    super.dispose();
  }

  Future<void> createChat({
    required String name,
    required List<User> participants,
  }) async {
    await chatService.createChat(
      name: name,
      participants: participants,
    );
  }
}

class ChatControllerScope extends InheritedWidget {
  final ChatController chatController;

  const ChatControllerScope({
    super.key,
    required this.chatController,
    required Widget child,
  }) : super(child: child);

  static ChatControllerScope of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ChatControllerScope>();
    assert(result != null, 'No ChatControllerScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
