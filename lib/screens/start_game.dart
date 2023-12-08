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





class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  SnakeGameState createState() => SnakeGameState();
}

class SnakeGameState extends State<SnakeGame> {
  final int gridPerRow = 20;
  final int gridPerCol = 40;
  final fontStyle = const TextStyle(color: Colors.white, fontSize: 20);
  final randomGen = Random();

  List<List<int>> snake = [[0, 1], [0, 0]];
  List<int> food = [0, 2];
  String direction = 'up';
  bool isPlaying = false;

  void startGame() {
    // Implement your game start logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              child: AspectRatio(
                aspectRatio: gridPerRow / (gridPerCol + 2),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridPerRow,
                  ),
                  itemCount: gridPerRow * gridPerCol,
                  itemBuilder: (BuildContext context, int index) {
                    var color;
                    var x = index % gridPerRow;
                    var y = (index / gridPerRow).floor();

                    bool isSnakeBody = false;
                    for (var pos in snake) {
                      if (pos[0] == x && pos[1] == y) {
                        isSnakeBody = true;
                        break;
                      }
                    }
                    if (snake.first[0] == x && snake.first[1] == y) {
                      color = Colors.green;
                    } else if (isSnakeBody) {
                      color = Colors.lightGreenAccent;
                    } else if (food[0] == x && food[1] == y) {
                      color = Colors.red;
                    } else {
                      color = Colors.grey[800];
                    }
                    return Container(
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPlaying ? Colors.red : Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    if (isPlaying) {
                      isPlaying = false;
                    } else {
                      startGame();
                    }
                  });
                },
                child: Text(
                  isPlaying ? 'End' : 'Start',
                  style: fontStyle,
                ),
              ),
              Text(
                'Score: ${snake.length - 1}',
                style: fontStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
