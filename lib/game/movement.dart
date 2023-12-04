import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArrowKeyHandler extends StatelessWidget {
  final VoidCallback onUp;
  final VoidCallback onLeft;
  final VoidCallback onDown;
  final VoidCallback onRight;

  const ArrowKeyHandler({
    Key? key,
    required this.onUp,
    required this.onLeft,
    required this.onDown,
    required this.onRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        if (event.isKeyPressed(
            LogicalKeyboardKey.arrowUp)) {
          // CHANGE DIRECTION Up
          print('Arrow Key Up');
        } else if (event.isKeyPressed(
            LogicalKeyboardKey.arrowRight)) {
          // CHANGE DIRECTION Right
          print('Arrow Key Right');
        } else if (event.isKeyPressed(
            LogicalKeyboardKey.arrowLeft)) {
          // CHANGE DIRECTION Left
          print('Arrow Key Left');
        } else if (event.isKeyPressed(
            LogicalKeyboardKey.arrowDown)) {
          // CHANGE DIRECTION Down
          print('Arrow Key Down');
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text('Press Arrow Keys'),
      ),
    );
  }
}