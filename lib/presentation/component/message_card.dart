import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
