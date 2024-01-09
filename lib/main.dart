import 'package:final_assessment/screens/how_to_play.dart';
import 'package:flutter/material.dart';
import 'screens/start_game.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: const Color(0xFF3D3D3D), // Your primary color
      scaffoldBackgroundColor: const Color(0xFF4D4D84), // Scaffold background color
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white), // Text color
      ),
    ),
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
        leading: const Image(image: AssetImage('assets/images/snake-logo.png')),
        title: const Text('Main Menu'),
        backgroundColor: const Color(0xFF4D4D84),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor, // Button color from theme
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: const Text('How To Play'),
          ),
          const SizedBox(width: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor, // Button color from theme
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
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Center(
            child: Text(
              'Hello and Welcome to my first game made with Flutter!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'About the Game:',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: GoogleFonts.lemon().fontFamily,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "I'm excited to share my journey of creating this Snake game using Flutter. "
                  "It's my first game, and I've learned a lot during the process. "
                  'Feel free to explore and enjoy the game!',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}