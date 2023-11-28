import 'package:final_assessment/screens/how_to_play.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const MainMenu(),
    },
  ));
}
// Navigation
class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Logo'),
        title: const Text('Main Menu'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors. red,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const HowToPlay(title: 'How To Play');
              }));
            },
            child: const Text('How To Play'),
          ),
          const SizedBox(width: 50),
        ],
      ),
    );
  }
}
