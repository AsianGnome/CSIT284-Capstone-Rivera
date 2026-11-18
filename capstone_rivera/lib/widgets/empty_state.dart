import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String message;
  const EmptyState({super.key, this.message = 'No classes today. Enjoy!'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          const Icon(Icons.celebration_outlined, size: 64),
          const SizedBox(height: 12),
          Text(message),
        ],
      ),
    );
  }
}