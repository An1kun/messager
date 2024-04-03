import 'package:flutter/material.dart';
import 'package:messager/presentation/controller/create_chat_controller.dart';

class CreateChatTextField extends StatefulWidget {
  const CreateChatTextField({super.key});

  @override
  State<CreateChatTextField> createState() => _CreateChatTextFieldState();
}

class _CreateChatTextFieldState extends State<CreateChatTextField> {
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
      child: TextField(
        onChanged: createChatController.changeName,
      ),
    );
  }
}
