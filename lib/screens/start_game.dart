import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  SnakeGameState createState() => SnakeGameState();
}

class SnakeGameState extends State<SnakeGame> {
  // Member variables
  late Snake _snake;
  late Timer _gameLoop;
  late Point<int> _foodPosition;
  int _score = 0;
  final int colCount = 50;
  final int rowCount = 50;
  static final _randomNumber = Random();
  bool isPlaying = false;
  late Direction _direction;
  late FocusNode _focusNode;
  late double _pixelsPerCell;
  double get padding => 10;
  final double _gameSize = 0.9; // Default game size

  // Lifecycle Methods
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
    _startGame();
  }

  // Initialization methods
  void _startGame() {
    isPlaying = true;
    _score = 0;
    _direction = Direction.down;
    _snake = Snake(position: Point(colCount ~/ 2, rowCount ~/ 2), direction: _direction);
    _foodPosition = _getRandomCell();

    // Initial game speed (milliseconds)
    int initialSpeed = 100;

    // Set up the game loop with an initial speed
    _gameLoop = Timer.periodic(Duration(milliseconds: initialSpeed), (timer) {
      _updateGame();

      // Check the score and adjust the game speed every 5 points
      if (_score % 5 == 0 && _score > 0) {
        int newSpeed = max(50, initialSpeed - (_score ~/ 5) * 10); // Decrease speed every 5 points
        if (timer.isActive) {
          timer.cancel();
        }
        _gameLoop = Timer.periodic(Duration(milliseconds: newSpeed), (timer) {
          _updateGame();
        });
      }
    });
  }

  // Utility methods
  double get availableSize {
    final maxSize = MediaQuery.of(context).size.shortestSide * _gameSize;
    return maxSize - (2 * padding);
  }

  Point<int> _getRandomCell() {
    return Point(_randomNumber.nextInt(colCount), _randomNumber.nextInt(rowCount));
  }

  // Update and rendering methods
  void _update(Timer timer) {
    if (!isPlaying) {
      timer.cancel();
      return;
    }

    _updateGame();
  }

  void _updateGame() {
    setState(() {
      _snake.update(_foodPosition, _getRandomCell, _onEat);

      Point<int> head = _snake.head;

      // Check if the snake goes off-screen
      if (head.x < 0 || head.x >= colCount || head.y < 0 || head.y >= rowCount) {
        _endGame();
        return;
      }

      if (_snake.checkCollision(rowCount, colCount)) {
        _endGame();
      }
    });
  }

  void _snakeKeyPressed(RawKeyEvent event) {
    _snake.keyPressed(event);
  }

  // UI rendering methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snake Game'),
        backgroundColor: const Color(0xFF4D4D84),
      ),
      body: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: _snakeKeyPressed,
        child: Center(
          child: Stack(
            children: [
              _buildGameContainer(),
              // Building the Score on the UI
              Positioned(
                top: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Score: $_score',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // method, which returns a container containing the game background, score display, and snake.
  Widget _buildGameContainer() {
    final maxSize = MediaQuery.of(context).size.shortestSide * _gameSize;
    final containerSize = maxSize - (2 * padding);
    _pixelsPerCell = containerSize / colCount;

    return Stack(
      children: [
        _buildGameBackground(containerSize, padding),
        CustomPaint(
          painter: SnakeGamePainter(_drawBackground, _drawSnake, containerSize),
        ),
      ],
    );
  }

  // method is responsible for creating a widget that represents the background of the game.
  Widget _buildGameBackground(double containerSize, double padding) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor, // Use primary color from the theme
      ),
    );
  }

  // Dialog and event handling methods
  void _endGame() {
    isPlaying = false;
    _gameLoop.cancel();
    _showGameOverDialog();
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          backgroundColor: const Color(0xFFB8DDF9), // Set background color
          content: Text('Your score: $_score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startGame(); // Restart the game
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text('Restart', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text('Main Menu', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _onEat() {
    _score++;
    _foodPosition = _getRandomCell();
  }

  void _drawBackground(Canvas canvas, Size size) {
    final backgroundColor = Theme.of(context).primaryColor;

    // Fill the entire canvas with the background color
    final backgroundPaint = Paint()..color = backgroundColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Draw food
    final foodPaint = Paint()..color = Colors.green;
    canvas.drawRect(
      Rect.fromLTWH(
        _foodPosition.x * _pixelsPerCell + padding,
        _foodPosition.y * _pixelsPerCell + padding,
        _pixelsPerCell,
        _pixelsPerCell,
      ),
      foodPaint,
    );
  }

  void _drawSnake(Canvas canvas) {
    final paint = Paint()..color = const Color(0xFFB8DDF9); // Snake Color
    final cellSize = availableSize / colCount;
    for (final cell in _snake.cells) {
      final cellX = padding + cell.x * cellSize;
      final cellY = padding + cell.y * cellSize;

      // Check if the snake cell is outside the game area and adjust its position
      final adjustedX = max(padding -10, min(cellX, availableSize - cellSize));
      final adjustedY = max(padding -10, min(cellY, availableSize - cellSize));

      // Draw the adjusted snake cell
      canvas.drawRect(
        Rect.fromLTWH(
          adjustedX,
          adjustedY,
          cellSize,
          cellSize,
        ),
        paint,
      );
    }

  }

  // Cleanup method
  @override
  void dispose() {
    _gameLoop.cancel();
    _focusNode.dispose();
    super.dispose();
  }
}

class SnakeGamePainter extends CustomPainter {
  final Function(Canvas, Size) drawBackground;
  final Function(Canvas) drawSnake;
  final double availableSize;

  SnakeGamePainter(this.drawBackground, this.drawSnake, this.availableSize);

  @override
  void paint(Canvas canvas, Size size) {
    drawSnake(canvas);
    drawBackground(canvas, size);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Snake {
  Snake({
    required Point<int> position,
    required Direction direction,
  }) : _cells = [position],
        _direction = direction;

  final List<Point<int>> _cells;
  bool isGameOver = false;
  Direction _direction;

  List<Point<int>> get cells => _cells;
  Point<int> get head => cells.first;
  Direction get direction => _direction;

  set direction(Direction newDirection) {
    if (!newDirection.isOpposite(_direction)) {
      _direction = newDirection;
    }
  }

  void eatFood(Point<int> foodPosition) {
    if (head == foodPosition) {
      _cells.add(foodPosition);
    }
  }

  bool checkCollision(int rowCount, int colCount) {
    Point<int> head = _cells.first;

    if (head.x < 0 || head.x >= colCount || head.y < 0 || head.y >= rowCount) {
      isGameOver = true;
      return true;
    }

    for (int i = 1; i < _cells.length; i++) {
      if (head == _cells[i]) {
        isGameOver = true;
        return true;
      }
    }

    return false;
  }

  void update(
      Point<int> foodPosition,
      Point<int> Function() getRandomCell,
      VoidCallback onEat,
      ) {
    final newHead = _direction.move(head);

    // Check if the new head is at the food position
    if (newHead == foodPosition) {
      // Snake ate the food, so add a new cell at the food position
      _cells.insert(0, foodPosition);
      // Callback to notify the game state that the snake ate
      onEat();
    } else {
      // Add the new head at the beginning of the cells
      _cells.insert(0, newHead);
      // Remove the last cell to maintain the snake's length
      _cells.removeLast();
    }
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
        return;
    }

    if (!newDirection.isOpposite(_direction)) {
      _direction = newDirection;
    }
  }

  void reset({required Point<int> position}) {
    _cells.clear();
    _cells.add(position);
    isGameOver = false;
    _direction = Direction.down;
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