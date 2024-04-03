import 'package:flutter/material.dart';
import 'package:messager/domain/model/user.dart';
import 'package:messager/domain/service/chat_service_impl.dart';
import 'package:messager/presentation/component/create_chat_button.dart';
import 'package:messager/presentation/component/create_chat_text_field.dart';
import 'package:messager/presentation/component/user_list.dart';
import 'package:messager/presentation/controller/create_chat_controller.dart';

typedef SelectUser = void Function(User);

class CreateChatPage extends StatefulWidget {
  const CreateChatPage({super.key});

  static const path = '/create-chat-page';

  static route() => MaterialPageRoute(
        settings: const RouteSettings(name: CreateChatPage.path),
        builder: (_) => const CreateChatPage(),
      );

  @override
  State<CreateChatPage> createState() => _CreateChatPageState();
}

class _CreateChatPageState extends State<CreateChatPage> {
  late final CreateChatController createChatController;

  @override
  void initState() {
    super.initState();
    createChatController = CreateChatController(chatService: ChatServiceImpl());
  }

  @override
  Widget build(BuildContext context) {
    return CreateChatControllerScope(
      createChatController: createChatController,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Chat'),
        ),
        body: const Column(
          children: [
            CreateChatTextField(),
            Expanded(child: UserList()),
            CreateChatButton(),
          ],
        ),
      ),
    );
  }
}
