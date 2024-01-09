import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Image(image: AssetImage('assets/images/snake-logo.png')),
        title: const Text('How To Play'),
        backgroundColor: const Color(0xFF4D4D84),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor, // Button color from theme
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Home'),
          ),
          const SizedBox(width: 50),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40.0),
                Text(
                  'Instructions:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: GoogleFonts.lemon().fontFamily,
                  ),
                ),
                 const Text(
                  'Welcome to Snake, a classic arcade game where your goal is to control the snake and achieve the highest score possible.'
                     '\n Snake game is credited to Taneli Armanto, who created it for Nokia phones in the late 1990s.'
                      '\n It gained immense popularity as a built-in game on Nokia mobile devices.',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 30.0),
                Text(
                  'Gameplay:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: GoogleFonts.lemon().fontFamily,
                  ),
                ),
                const Text(
                  '1. Eat food to grow the snake and earn points. Each food item increases your score.'
                      '\n2. Avoid crashing into the snake\'s own body, as it leads to game over.'
                      '\n3. Be cautious not to collide with the edges of the screen it leads to game over.'
                      '\n4. The longer the snake, the more challenging the game becomes.',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 30.0),
                Text(
                  'Controls:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: GoogleFonts.lemon().fontFamily,
                  ),
                ),
                const Text(
                  '1. Keyboard User Friendly - Use Arrow Keys to control the snake:'
                      '\n   - Up Arrow: Move Up'
                      '\n   - Down Arrow: Move Down'
                      '\n   - Left Arrow: Move Left'
                      '\n   - Right Arrow: Move Right'
                      '\n   - Note that you cannot go the opposite way of your current direction',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}