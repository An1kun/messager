import 'package:messager/domain/model/message.dart';
import 'package:messager/domain/model/user.dart';

class Chat {
  final String id;
  final String name;
  final Message? lastMessage;
  final List<User> participants;

  const Chat({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.participants,
  });
}
