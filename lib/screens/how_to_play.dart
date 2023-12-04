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
            child: const Text('Home'),
          ),
          const SizedBox(width: 50),
        ],
      ),
      // Body for "How to play"
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
              'Greeting:',
              style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic
              ),
            ),
              Text(
                '1. PlaceHolder',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Instructions:',
                style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic
                ),
              ),
              Text(
                '1. PlaceHolder',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Controls:',
                style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic
                ),
              ),
              Text(
                '1. PlaceHolder',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
