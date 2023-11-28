import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({super.key, required this.title,});
  final String title;
  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: const Text('Logo'),
      title: Text(title),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors. red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Home'),
        ),
        const SizedBox(width: 50),
      ],
    );
  }
}