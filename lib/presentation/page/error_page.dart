import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  static const path = 'error-page';

  static route() => MaterialPageRoute(
        settings: const RouteSettings(name: ErrorPage.path),
        builder: (_) => const ErrorPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
