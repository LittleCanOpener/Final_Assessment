import 'package:flutter/material.dart';
import 'dart:math';
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
  late bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  void _setup() {
    size = const Point(300, 400); //  Width and Height of Canvas
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
      ..color = Colors.white;
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
      _isGameOver = true;
    }
    _snake.update();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
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
