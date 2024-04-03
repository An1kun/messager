import 'package:messager/domain/model/user.dart';

class Message {
  final String id;
  final String text;
  final User author;
  final DateTime timestamp;

  const Message({
    required this.id,
    required this.text,
    required this.author,
    required this.timestamp,
  });
}
