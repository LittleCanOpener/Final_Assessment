import 'package:final_assessment/screens/how_to_play.dart';
import 'package:final_assessment/screens/main-menu.dart';
import 'package:final_assessment/screens/start_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const MainMenu(),
      '/second': (context) => const HowToPlay(),
      '/third': (context) =>  const SnakeGameSketch(),
    },
  ));
}