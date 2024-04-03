import 'package:messager/domain/model/chat.dart';
import 'package:messager/domain/model/user.dart';

abstract interface class ChatService {
  Stream<Chat> readChats({required String userId});

  Future<void> createChat({
    required String name,
    required List<User> participants,
  });
}
