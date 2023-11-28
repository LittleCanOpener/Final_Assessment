import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// Navigation
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBar(
        leading: const Text('Logo'),
        title: const Text('Main Menu'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors. red,
            ),
            onPressed: () {},
            child: const Text('Button'),
          ),
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors. red,
            ),
            onPressed: () {},
            child: const Text('Button'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors. red,
            ),
            onPressed: () {},
            child: const Text('Button'),
          ),

        ],
      ),
    );
  }
}
