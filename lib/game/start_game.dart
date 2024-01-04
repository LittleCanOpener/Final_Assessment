import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:async';

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
  late Timer _gameLoop;
  final FocusNode _focusNode = FocusNode();
  late Point<int> _foodPosition;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      size = Point(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      );
      setup();
      startGameLoop();
    });
  }

  Future<void> setup() async {
    size = const Point(500, 500);
    colCount = (width / _pixelsPerCell).floor();
    rowCount = (height / _pixelsPerCell).floor();
    _snake = Snake(position: _getRandomCell());
    _foodPosition = _getRandomCell(); // Initialize food position
    while (_snake.cells.contains(_foodPosition)) {
      _foodPosition = _getRandomCell();
    }
  }

  Future<void> draw(Canvas canvas, Size size) async {
    _update();
    _drawBackground(canvas, size);
    _drawSnake(canvas);
  }

  void _drawBackground(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color.fromARGB(255, 51, 51, 51);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    final foodPaint = Paint()..color = Colors.green;
    canvas.drawRect(
      Rect.fromLTWH(
        _foodPosition.x * _pixelsPerCell,
        _foodPosition.y * _pixelsPerCell,
        _pixelsPerCell,
        _pixelsPerCell,
      ),
      foodPaint,
    );
  }

  void _drawSnake(Canvas canvas) {
    final paint = Paint()..color = Colors.brown;
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
    if (!_snake.isInBounds(width: colCount, height: rowCount) || _snake.checkCollision()) {
      // TODO: Handle game over or other conditions when snake is out of bounds or collides
      // TODO: For example, you can stop the game loop and show a game over screen
      _gameLoop.cancel();
      //TODO: game over logic here
    } else {
      // Generate a new food position if needed
      if (_snake.head == _foodPosition) {
        _foodPosition = _getRandomCell();
      }

      // Check if the snake ate the food
      _snake.eatFood(_foodPosition);

      // Update the snake
      _snake.update();
    }
  }

  Future<void> startGameLoop() async {
    await Future.delayed(const Duration(seconds: 1)); // Delay for 1 second
    _gameLoop = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        // Trigger a redraw on each iteration
      });
    });
  }

  @override
  void dispose() {
    _gameLoop.cancel();
    super.dispose();
  }

  Point<int> _getRandomCell() {
    final random = Random();
    return Point(random.nextInt(colCount), random.nextInt(rowCount));
  }

  double get height => size.y.toDouble();
  double get width => size.x.toDouble();

  @override
  // TODO: STYLE THE GAME
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Snake",
      home: Scaffold(
        appBar: AppBar(
          leading: const Text('Logo'),
          title: const Text('How To Play'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Home'),
            ),
            const SizedBox(width: 50),
          ],
        ),
        body: RawKeyboardListener(
          focusNode: _focusNode,
          onKey: (RawKeyEvent event) {
            _snake.keyPressed(event);
          },
          child: CustomPaint(
            painter: SnakeGamePainter(draw),
          ),
        ),
      ),
    );
  }
}

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
  set direction(Direction newDirection) {
    if (!newDirection.isOpposite(_direction)) {
      _direction = newDirection;
    }
  }
  void eatFood(Point<int> foodPosition) {
    if (head == foodPosition) {
      // Snake ate the food, so add a new cell at the food position
      _cells.add(foodPosition);
    }
  }


  bool checkCollision() {
    for (int i = 1; i < _cells.length; i++) {
      if (_cells[i] == head) {
        // Collision with the snake's body
        return true;
      }
    }
    return false;
  }

  void update() {
    final newHead = direction.move(head);
    _cells.removeLast();
    _cells.insert(0, newHead);
  }

  bool isInBounds({required int width, required int height}) {
    final head = cells.first;
    return head.x >= 0 && head.x < width && head.y >= 0 && head.y < height;
  }

  void keyPressed(RawKeyEvent event) {
    final logicalKey = event.logicalKey;
    Direction newDirection;

    switch (logicalKey) {
      case LogicalKeyboardKey.arrowUp:
        newDirection = Direction.up;
        break;
      case LogicalKeyboardKey.arrowDown:
        newDirection = Direction.down;
        break;
      case LogicalKeyboardKey.arrowLeft:
        newDirection = Direction.left;
        break;
      case LogicalKeyboardKey.arrowRight:
        newDirection = Direction.right;
        break;
      default:
      // No arrow key pressed, keep the current direction
        return;
    }

    // Set the new direction only if it's not opposite to the current direction
    if (!newDirection.isOpposite(_direction)) {
      _direction = newDirection;
    }
  }
}

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
  }

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
  }
}