import 'dart:async';

import 'package:messager/domain/model/chat.dart';
import 'package:messager/domain/model/user.dart';
import 'package:messager/domain/service/chat_service.dart';

class ChatServiceImpl implements ChatService {
  static final ChatServiceImpl _instance = ChatServiceImpl._internal();

  ChatServiceImpl._internal();

  factory ChatServiceImpl() => _instance;

  StreamController<Chat> _chatsController = StreamController();

  @override
  Future<void> createChat({
    required String name,
    required List<User> participants,
  }) async {
    final chat = Chat(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      participants: participants,
      lastMessage: null,
    );

    _chatsController.sink.add(chat);
  }

  @override
  Stream<Chat> readChats({required String userId}) {
    return _chatsController.stream;
  }
}
