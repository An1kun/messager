import 'package:messager/domain/model/message.dart';
import 'package:messager/domain/model/user.dart';

abstract interface class MessageService {
  Future<List<Message>> readMessages({required String chatId});

  Future<void> createMessage({
    required String chatId,
    required String text,
    required User author,
  });
}
