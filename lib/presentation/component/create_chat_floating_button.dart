import 'package:flutter/material.dart';
import 'package:messager/presentation/page/create_chat_page.dart';

class CreateChatFloatingButton extends StatelessWidget {
  const CreateChatFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(CreateChatPage.path);
      },
      child: const Icon(Icons.add),
    );
  }
}
