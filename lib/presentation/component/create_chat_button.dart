import 'package:flutter/material.dart';
import 'package:messager/presentation/controller/create_chat_controller.dart';

class CreateChatButton extends StatefulWidget {
  const CreateChatButton({super.key});

  @override
  State<CreateChatButton> createState() => _CreateChatButtonState();
}

class _CreateChatButtonState extends State<CreateChatButton> {
  late final CreateChatController createChatController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createChatController =
        CreateChatControllerScope.of(context).createChatController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 24.0),
      child: ElevatedButton(
        onPressed: () async {
          await createChatController.createChat();
          if (context.mounted) Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 64.0,
            vertical: 24.0,
          ),
        ),
        child: const Text('Create Chat'),
      ),
    );
  }
}
