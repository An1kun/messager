import 'package:flutter/material.dart';
import 'package:messager/presentation/page/chat_list_page.dart';
import 'package:messager/presentation/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ChatListPage.path,
      onGenerateInitialRoutes: (initialRoute) => [
        ChatListPage.route(),
      ],
      onGenerateRoute: onGenerateRoute,
    );
  }
}
