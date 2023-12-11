import 'dart:math';
import 'package:flutter/services.dart';

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