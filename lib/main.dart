import 'package:final_assessment/screens/how_to_play.dart';
import 'package:final_assessment/game/start_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const MainMenu(),
      '/second': (context) => const HowToPlay(),
      '/third': (context) =>  const SnakeGame(),
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
              foregroundColor: Colors. black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: const Text('How To Play'),
          ),
          const SizedBox(width: 50),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors. black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            child: const Text('Play Game'),
          ),
          const SizedBox(width: 50),
        ],
      ),
      // Body for Home Page
      body: const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 50),
                Center(
                  child: Text('Hello And Welcome to my first game made with Flutter',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}