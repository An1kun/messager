import 'package:flutter/material.dart';
import 'package:messager/domain/model/user.dart';
import 'package:messager/domain/service/chat_service.dart';

class CreateChatController extends ChangeNotifier {
  final ChatService chatService;

  CreateChatController({required this.chatService});

  String name = '';
  List<User> participants = <User>[];

  void selectParticipant(User user) {
    if (participants.contains(user)) {
      participants.remove(user);
    } else {
      participants.add(user);
    }
    notifyListeners();
  }

  void changeName(String name) {
    this.name = name;
    notifyListeners();
  }

  Future<void> createChat() async {
    await chatService.createChat(name: name, participants: participants);
    notifyListeners();
  }
}

class CreateChatControllerScope extends InheritedWidget {
  final CreateChatController createChatController;

  const CreateChatControllerScope({
    super.key,
    required this.createChatController,
    required Widget child,
  }) : super(child: child);

  static CreateChatControllerScope of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<CreateChatControllerScope>();
    assert(result != null, 'No CreateChatControllerScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
