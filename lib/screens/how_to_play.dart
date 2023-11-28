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
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors. red,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text('How To Play'),
          ),
          const SizedBox(width: 50),
        ],
      ),
    );
  }
}