import 'package:flutter/material.dart';
import 'package:messager/presentation/page/chat_list_page.dart';
import 'package:messager/presentation/page/chat_page.dart';
import 'package:messager/presentation/page/create_chat_page.dart';
import 'package:messager/presentation/page/error_page.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ChatPage.path:
      return ChatPage.route();
    case ChatListPage.path:
      return ChatListPage.route();
    case CreateChatPage.path:
      return CreateChatPage.route();
    default:
      return ErrorPage.route();
  }
}
