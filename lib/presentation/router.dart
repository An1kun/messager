import 'package:flutter/material.dart';
import 'package:messager/presentation/pages/chat_list_page.dart';
import 'package:messager/presentation/pages/chat_page.dart';
import 'package:messager/presentation/pages/error_page.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ChatPage.path:
      return ChatPage.route;
    case ChatListPage.path:
      return ChatListPage.route;
    default:
      return ErrorPage.route;
  }
}
