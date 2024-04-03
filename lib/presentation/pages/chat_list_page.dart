import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  static const path = '/chat-list-page';

  static final route = MaterialPageRoute(
    settings: const RouteSettings(name: ChatListPage.path),
    builder: (_) => const ChatListPage(),
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
