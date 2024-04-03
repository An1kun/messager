import 'package:messager/domain/model/user.dart';

class Chat {
  final String id;
  final String name;
  final List<User> participants;

  const Chat({
    required this.id,
    required this.name,
    required this.participants,
  });
}
