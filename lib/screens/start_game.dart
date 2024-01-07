import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const SnakeGameApp());
}

class SnakeGameApp extends StatelessWidget {
  const SnakeGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: SnakeGame()),
      ),
    );
  }
}

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  SnakeGameState createState() => SnakeGameState();
}

class SnakeGameState extends State<SnakeGame> {
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
  double get padding => 10.0;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
    _startGame();
  }

  void _startGame() {
    isPlaying = true;
    _score = 0;
    _direction = Direction.down;
    _snake = Snake(position: Point(colCount ~/ 2, rowCount ~/ 2), direction: _direction);
    _foodPosition = _getRandomCell();
    _gameLoop = Timer.periodic(const Duration(milliseconds: 100), _update);
  }

  double get availableSize {
    final maxSize = MediaQuery.of(context).size.shortestSide * 0.9;
    return maxSize - (2 * padding);
  }

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

      if (_snake.checkCollision(rowCount, colCount)) {
        _endGame();
      }
    });
  }

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
          content: Text('Your score: $_score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startGame(); // Restart the game
              },
              child: const Text('Restart'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Dismiss'),
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
    const padding = 10.0; // Adjust the padding to match the BoxShadow

    // Draw the border
    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), borderPaint);

    // Draw the background
    final paint = Paint()..color = const Color.fromARGB(255, 51, 51, 51);
    canvas.drawRect(Rect.fromLTWH(padding, padding, size.width - 2 * padding, size.height - 2 * padding), paint);

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
    final paint = Paint()..color = Colors.brown; // Snake Color

    final cellSize = availableSize / colCount;

    for (final cell in _snake.cells) {
      canvas.drawRect(
        Rect.fromLTWH(
          padding + cell.x * cellSize,
          padding + cell.y * cellSize,
          cellSize,
          cellSize,
        ),
        paint,
      );
    }
  }

  Widget _buildScoreDisplay() {
    return Text(
      'Score: $_score',
      style: const TextStyle(color: Colors.black, fontSize: 20),
    );
  }

  @override
  void dispose() {
    _gameLoop.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  Point<int> _getRandomCell() {
    return Point(_randomNumber.nextInt(colCount), _randomNumber.nextInt(rowCount));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snake Game'),
      ),
      body: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: _snakeKeyPressed,
        child: Center(
          child: _buildGameContainer(),
        ),
      ),
    );
  }

  Widget _buildGameContainer() {
    final maxSize = MediaQuery.of(context).size.shortestSide * 0.9;
    const padding = 10.0;
    final containerSize = maxSize - (2 * padding);
    _pixelsPerCell = containerSize / colCount;

    return Stack(
      alignment: Alignment.center,
      children: [
        _buildGameBackground(containerSize, padding),
        Column(
          children: [
            _buildScoreDisplay(),
            Expanded(
              child: CustomPaint(
                painter: SnakeGamePainter(_drawBackground, _drawSnake, containerSize),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildGameBackground(double containerSize, double padding) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4.0,
            offset: const Offset(3.5, 3.5),
          ),
        ],
      ),
    );
  }
  void _snakeKeyPressed(RawKeyEvent event) {
    _snake.keyPressed(event);
  }
}

class SnakeGamePainter extends CustomPainter {
  final Function(Canvas, Size) drawBackground;
  final Function(Canvas) drawSnake;
  final double availableSize;

  SnakeGamePainter(this.drawBackground, this.drawSnake, this.availableSize);

  @override
  void paint(Canvas canvas, Size size) {
    drawBackground(canvas, size);
    drawSnake(canvas);
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




// TODO: Consider extracting the game logic into a separate class for better organization and separation of concerns.
// TODO: Consider using a StatefulWidget for the game screen, so that you can easily reset the game state when needed.
// TODO: Implement a scoring system to keep track of the player's score based on the number of food items eaten.
// TODO: Implement a game over screen that displays the final score and allows the player to restart the game.
// TODO: Add functionality to pause and resume the game. Implement a pause button on the UI for better user experience.
// TODO: Implement levels or increase the difficulty over time to make the game more challenging as the player progresses.
// TODO: Add sound effects or background music to enhance the gaming experience. Consider using the audioplayers package.
// TODO: Implement touch gestures for controlling the snake's direction, making the game more accessible on touch devices.
// TODO: Add animations for smoother transitions, such as when the snake moves or eats food.
// TODO: Refactor the code to use constants or enums for color values and other repeated values to improve code readability.
// TODO: Implement a settings menu where the player can customize game options like speed, grid size, or snake appearance.
// TODO: Add comments to explain complex parts of the code, making it more understandable for other developers or your future self.
// TODO: Consider implementing unit tests for critical game logic to ensure the stability of your code.
// TODO: Optimize the code for performance, especially the draw method, to ensure smooth gameplay on different devices.
// TODO: Handle screen orientation changes gracefully, preserving the game state and layout.
// TODO: Consider adding a splash screen or loading indicator while the game is initializing.
// TODO: Implement a more visually appealing UI, including a game title, better fonts, and overall design improvements.
// TODO: Allow the player to choose different snake skins or themes.
// TODO: Implement a tutorial or instructions screen
