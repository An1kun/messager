import 'package:flutter/material.dart';
import 'package:messager/domain/model/chat.dart';
import 'package:messager/presentation/page/chat_list_page.dart';
import 'package:messager/presentation/page/chat_page.dart';
import 'package:messager/presentation/page/create_chat_page.dart';
import 'package:messager/presentation/page/error_page.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ChatPage.path:
      final chat = settings.arguments as Chat;
      return ChatPage.route(chat: chat);
    case ChatListPage.path:
      return ChatListPage.route();
    case CreateChatPage.path:
      return CreateChatPage.route();
    default:
      return ErrorPage.route();
  }
}
