import 'package:flutter/material.dart';
import 'package:messager/domain/model/chat.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(chat.name),
          ],
        ),
      ),
    );
  }
}
