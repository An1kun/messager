import 'package:flutter/material.dart';
import 'package:messager/presentation/pages/chat_list_page.dart';
import 'package:messager/presentation/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: ChatListPage.path,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
