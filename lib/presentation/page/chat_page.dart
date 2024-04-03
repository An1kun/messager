import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static const path = '/chat-page';

  static route() => MaterialPageRoute(
        settings: const RouteSettings(name: ChatPage.path),
        builder: (_) => const ChatPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
