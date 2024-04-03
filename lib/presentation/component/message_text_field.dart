import 'package:flutter/material.dart';
import 'package:messager/presentation/controller/message_controller.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({super.key});

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  late final MessageController messageController;
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    messageController = MessageControllerScope.of(context).messageController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 24.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(controller: textEditingController),
          ),
          ElevatedButton(
            onPressed: () {
              messageController.createMessage(textEditingController.text);

              textEditingController.clear();
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}
