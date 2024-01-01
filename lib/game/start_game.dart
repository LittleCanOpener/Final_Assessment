import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'snake.dart';

class SnakeGameSketch extends StatefulWidget {
  const SnakeGameSketch({super.key});

  @override
  SnakeGameSketchState createState() => SnakeGameSketchState();
}

class SnakeGameSketchState extends State<SnakeGameSketch> {
  final _pixelsPerCell = 10.0;
  late int colCount;
  late int rowCount;
  late Point<double> size;
  late Snake _snake;
  late Timer _gameLoop; // Added Timer variable

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      size = Point(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      );
      setup();
      startGameLoop(); // Start the game loop when the widget is initialized
    });
  }

  Future<void> setup() async {
    size = const Point(500, 500); // Width and Height of Canvas
    colCount = (width / _pixelsPerCell).floor();
    rowCount = (height / _pixelsPerCell).floor();
    _snake = Snake(position: _getRandomCell());
  }

  Future<void> draw(Canvas canvas, Size size) async {
    _update();
    _drawBackground(canvas, size);
    _drawSnake(canvas);
  }

  void _drawBackground(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 51, 51, 51);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  void _drawSnake(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.brown;
    for (final cell in _snake.cells) {
      canvas.drawRect(
        Rect.fromLTWH(
          cell.x * _pixelsPerCell,
          cell.y * _pixelsPerCell,
          _pixelsPerCell,
          _pixelsPerCell,
        ),
        paint,
      );
    }
  }

  void _update() {
    if (!_snake.isInBounds(width: colCount, height: rowCount)) {
      // Handle game over or other conditions when snake is out of bounds
    }
    _snake.update();
  }

  // Start the game loop
  void startGameLoop() {
    _gameLoop = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        // Trigger a redraw on each iteration
      });
    });
  }

  @override
  void dispose() {
    _gameLoop.cancel(); // Cancel the game loop when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Snake",
      home: Scaffold(
        appBar: AppBar(),
        body: CustomPaint(
          painter: SnakeGamePainter(draw),
        ),
      ),
    );
  }

  Point<int> _getRandomCell() {
    final random = Random();
    return Point(random.nextInt(colCount), random.nextInt(rowCount));
  }

  double get height => size.y.toDouble();
  double get width => size.x.toDouble();
} // SnakeGameSketchState

class SnakeGamePainter extends CustomPainter {
  final Function(Canvas, Size) draw;
  SnakeGamePainter(this.draw);

  @override
  void paint(Canvas canvas, Size size) {
    draw(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
