import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Logo'),
        title: const Text('How To Play'),
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Instructions:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Welcome to Snake, a classic arcade game where your goal is to control the snake and achieve the highest score possible.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Gameplay:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '1. Eat food to grow the snake and earn points. Each food item increases your score.'
                      '\n2. Avoid crashing into the snake\'s own body, as it leads to game over.'
                      '\n3. Be cautious not to collide with the edges of the screen.'
                      '\n4. The longer the snake, the more challenging the game becomes.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Controls:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '1. Keyboard User Friendly - Use Arrow Keys to control the snake:'
                      '\n   - Up Arrow: Move Up'
                      '\n   - Down Arrow: Move Down'
                      '\n   - Left Arrow: Move Left'
                      '\n   - Right Arrow: Move Right',
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