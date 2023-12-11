import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

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
    return CustomPaint(
      painter: SnakeGamePainter(draw),
    );
  }

  Point<int> _getRandomCell() {
    final random = Random();
    return Point(random.nextInt(colCount), random.nextInt(rowCount));
  } // _getRandomCell

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

class Snake {
  Snake({
    required Point<int> position,
  }) : _cells = [position];

  final List<Point<int>> _cells;
  List<Point<int>> get cells => _cells;

  Point<int> get head => cells.first;

  Direction _direction = Direction.right;
  Direction get direction => _direction;
  set direction(Direction newDirection){
    if (!newDirection.isOpposite(_direction)) {
      _direction = newDirection;
    }
  }

  void update(){
    final newHead = direction.move(head);

    _cells.removeLast();
    _cells.insert(0, newHead);
  } // Update
  bool isInBounds({required int width, required int height}) {
    final head = cells.first;
    return head.x >= 0 && head.x < width && head.y >= 0 && head.y < height;
  }
  void keyPressed(event) {
    if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
      direction = Direction.up;
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
      direction = Direction.down;
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      direction = Direction.left;
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      direction = Direction.right;
    }
  } // event
} // Snake

enum Direction {
  left,
  up,
  right,
  down,
}

extension on Direction {
  bool isOpposite(Direction other) {
    switch (this) {
      case Direction.left:
        return other == Direction.right;
      case Direction.up:
        return other == Direction.down;
      case Direction.right:
        return other == Direction.left;
      case Direction.down:
        return other == Direction.up;
    }
  } // isOpposite
  Point<int> move(Point<int> position) {
    switch (this) {
      case Direction.left:
        return position + const Point(-1, 0);
      case Direction.up:
        return position + const Point(0, -1);
      case Direction.right:
        return position + const Point(1, 0);
      case Direction.down:
        return position + const Point(0, 1);
    }
  } // Move
} // _Direction
