import 'package:messager/domain/model/message.dart';
import 'package:messager/domain/model/user.dart';
import 'package:messager/domain/service/message_service.dart';

class MessageServiceImpl implements MessageService {
  Map<String, List<Message>> _messages = {};

  @override
  Future<void> createMessage({
    required String text,
    required String chatId,
    required User author,
  }) async {
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      timestamp: DateTime.now(),
      author: author,
    );

    if (_messages.containsKey(chatId)) {
      _messages[chatId]!.add(message);
    } else {
      _messages[chatId] = [message];
    }
  }

  @override
  Future<List<Message>> readMessages({required String chatId}) async {
    return _messages[chatId] ?? [];
  }
}
