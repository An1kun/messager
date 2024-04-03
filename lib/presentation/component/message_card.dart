import 'package:flutter/material.dart';
import 'package:messager/domain/model/message.dart';
import 'package:messager/presentation/controller/user_controller.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  late final UserController userController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userController = UserControllerScope.of(context).userController;
  }

  @override
  Widget build(BuildContext context) {
    bool isCurrentUser =
        userController.currentUser.id == widget.message.author.id;

    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: isCurrentUser ? TextDirection.rtl : TextDirection.ltr,
          children: [
            const CircleAvatar(minRadius: 16.0, maxRadius: 16.0),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: isCurrentUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message.author.name,
                  style: const TextStyle(fontSize: 10.0),
                ),
                Text(
                  widget.message.text,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
